SHELL := /bin/bash
DISK_IMAGE_PATH := /var/lib/libvirt/images/dev-win-10.qcow2

start:
	if [[ ! -f ${DISK_IMAGE_PATH} ]]; then \
		sudo qemu-img create -f qcow2 ${DISK_IMAGE_PATH} 30G; \
	fi
	virsh -c qemu:///system net-start default
	virsh -c qemu:///system define dev-win-10.xml
	virsh -c qemu:///system start dev-win-10
