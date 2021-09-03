# Libvirt Windows 10 

This one is obviously not a Vagrant configuration, but it's appropriate to keep it in this repository.

Building Windows boxes with Packer/Vagrant is actually quite painful anyway, so this just uses the libvirt XML format to define a QEMU machine for use with Windows. Since it's QEMU/KVM, it's really fast compared to running Windows on Virtualbox.

Run `make start`, then use [this](https://matteocroce.medium.com/windows-as-qemu-guest-a115a56043b6) setup guide for it.


