#!/bin/bash

# Unload all Nvidia drivers
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r nvidia_uvm
modprobe -r nvidia
# Looks like these might need to be unloaded on Ryzen Systems. Not sure yet.
modprobe -r ipmi_devintf
modprobe -r ipmi_msghandler

# Unbind the GPU from display driver
virsh nodedev-detach pci_0000_0e_00_0
virsh nodedev-detach pci_0000_0e_00_1
virsh nodedev-detach pci_0000_0e_00_2
virsh nodedev-detach pci_0000_0e_00_3

# Load VFIO Kernel Module  
modprobe vfio-pci  
