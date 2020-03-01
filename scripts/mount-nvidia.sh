#!/bin/bash
set -x

# Unload VFIO-PCI Kernel Driver
modprobe -r vfio-pci
modprobe -r vfio_iommu_type1
modprobe -r vfio
  
# Re-Bind GPU to Nvidia Driver
virsh nodedev-reattach pci_0000_0e_00_0
virsh nodedev-reattach pci_0000_0e_00_1
virsh nodedev-reattach pci_0000_0e_00_2
virsh nodedev-reattach pci_0000_0e_00_3

nvidia-xconfig --query-gpu-info > /dev/null 2>&1

modprobe nvidia_drm
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia
modprobe ipmi_devintf
modprobe ipmi_msghandler
