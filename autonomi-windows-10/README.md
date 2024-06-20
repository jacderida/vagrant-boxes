# Windows 10 for Autonomi Testing

Provides a definition for a Windows 10 machine that can be used with QEMU/libvirt.

## Libvirt Setup

This section provides some notes for setting up libvirt for the first time.

Install QEMU and libvirt for your platform using whatever packaging system is available. Include an
installation of the GUI `virt-manager`, which will provide a means to connect to the Windows guest.

In my case, the platform is Arch:
```
sudo pacman -S libvirt qemu qemu-base qemu-chardev-spice qemu-hw-display-qxl virt-manager
```

Start the libvirt daemon:
```
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

Initially start the default network as the root user:
```
sudo virsh --connect qemu:///system net-autostart default
```

Configure `virsh` to work in user-mode by default:
```
uri_default = "qemu:///session"
```

Use `virsh pool-list` to check if a `default` storage pool already exists, and use `virsh
pool-dumpxml` to check it's pointing to `~/.local/share/libvirt/images`.

If it doesn't exist, create it using the configuration in this repository:
```
virsh pool-define default_pool.xml
virsh pool-start default
virsh pool-autostart default
```

## Windows 10

### VM Creation and Setup

Download a [Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10ISO) and put
it at `~/.local/share/libvirt/images`.

Download the latest [VirtIO Drivers ISO](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso) and put it at `~/.local/share/libvirt/images`.

Create a qcow2 volume for the guest's hard drive:
```
virsh vol-create-as default autonomi-win-10.img 64G --format qcow2
```

This will output the volume to `~/.local/share/libvirt/images/autonomi-win-10.img`. Since it's
qcow2, the size of the volume will expand dynamically as the VM is used, so it won't be 64GB when
it's created.

If necessary, edit the `autonomi-win-10.xml` file in this directory to point the three disk
devices to the Windows ISO, the VirtIO ISO and the qcow2 volume file, respectively.

Finally, create and start the VM:
```
virsh define autonomi-win-10.xml
virsh start autonomi-win-10
```

Use the `virt-manager` GUI to connect to the VM:
```
virt-manager --connect qemu:///session
```

### Windows Installation

The Windows installation process can now proceed.

Shortly, you will be required to specify an install location, but no disks will be available. At
this point, click on the 'Load Driver' button and install the storage driver. It's available on the
mounted VirtIO disc at `E:\viostor\w10\amd64`. The network and display drivers can also be installed
here. They are at `E:\NetKVM\w10\amd64` and `E:\qxldod\w10\amd64`, respectively. After installing
the drivers, create a new partition on the 64GB disk, and use that as the install location.

### Post Install

After going through the setup guff and getting access to your installation, if you installed the
display driver during setup, you should be able to resize the display to something more reasonable
than the default. Modes like 1080p should be available. After this, the next thing to do is install
the VirtIO Guest Tools. The installer is at `E:\virtio-win-guest-tools.exe`. This will enable
crucial things like the shared clipboard. The performance of the VM should be quite snappy.

Now run Windows Update, and keep running it until you eventually get everything.

### Shared Folder

It's very useful to have a shared folder between the host and guest. This can be configured after
the guest tools have been installed. Follow these steps:

* On the host, create a directory at `~/.local/share/libvirt/shared`.
* Shutdown the running VM.
* Use the `virt-manager` GUI to access the details for the VM: `Virtual Machine` -> `Details`.
* Go to the `Memory` section and set the `Enable shared memory` checkbox.
* Click on the `Apply` button in the bottom right.
* Click on the `Add Hardware` button in the bottom left.
* In the `Add New Virtual Hardware` dialog, click on the `Filesystem`.
* Set the `Source path` by clicking on the `Browse` button to its right.
* In the `Locate directory volume` dialog, click on the `Browse Local` button and use the resulting
  dialog to locate and select the `~/.local/share/libvirt/shared` directory.
* Click on the `Finish` button to add the shared folder to the machine configuration.
* Start the VM again.
* From the VM, download the `WinFsp 2023` MSI from [here](https://github.com/winfsp/winfsp/releases/).
* Run the MSI and install only the `Core` option.
* Use `services.msc` to locate the `VirtIO-FS Service`. Start the service, but leave it as a
  `Manual` start up. This is because snapshots are not supported when a shared folder is added.

The `shared` folder should now be available as the `Z` drive on the Windows guest. Test it by
creating a file from the host.

When you need to take a snapshot of the VM, you will need to shut it down and remove the shared
folder, then start it up again.

### Snapshots

With updates applied and shared folders configured, create the first snapshot of the machine.
However, as mentioned above, snapshots are not supported when shared folders are added, so you need
to remove it first. Do that by shutting the VM down and using the `virt-manager` GUI to remove the
shared folder. Then boot the VM up again.

Use `virsh` to take a snapshot:
```
virsh snapshot-create-as \
    --domain autonomi-win-10 \
    --name "after-win-updates" \
    --description "Updates have been applied and shared folders have been configured"
```

To restore the same snapshot:
```
virsh snapshot-revert autonomi-win-10 after-win-updates
```

### Cross Compilation for Rust

The `safenode-manager.exe` binary can be shared between a Windows guest and Linux host by cross
compiling the binary using `cross` on the Linux host, then once the binary is built, it can be made
available via the shared folder.

Steps:
```
rustup target add x86_64-pc-windows-gnu
cross build --release --target x86_64-pc-windows-gnu --bin safenode-manager
```
