# VFIO windows setup
This setup is designed to have a fully functional install of windows accessible through Looking Glass, and have automatic binding and unbinding of the GPU. Here is a quick summary of setting this up and a couple of hiccups that have popped up along the way in the past.

## Install 
- Get a windows iso (preferably LTSC) and use it to create a VM. Give it a whole disk device to work with (/dev/sda)
- In the install, make sure you select Q35 and qemu as the UEFI interface
- At the top of the xml, use the following schema to prevent the nvidia code 43 error:

```
<domain xmlns:qemu="http://libvirt.org/schemas/domain/qemu/1.0" type="kvm">
```

- For CPU tuning, use the following CPU pinning, specialized for Ryzen CPUs:

```
<cputune>
    <vcpupin vcpu="0" cpuset="0"/>
    <vcpupin vcpu="1" cpuset="8"/>
    <vcpupin vcpu="2" cpuset="1"/>
    <vcpupin vcpu="3" cpuset="9"/>
    <vcpupin vcpu="4" cpuset="2"/>
    <vcpupin vcpu="5" cpuset="10"/>
    <vcpupin vcpu="6" cpuset="3"/>
    <vcpupin vcpu="7" cpuset="11"/>
    <vcpupin vcpu="8" cpuset="4"/>
    <vcpupin vcpu="9" cpuset="12"/>
    <vcpupin vcpu="10" cpuset="5"/>
    <vcpupin vcpu="11" cpuset="13"/>
</cputune>
```

- Replace the original hyperv block and kvm block with this (again, to prevent code 43 error):

```
<hyperv>
      <relaxed state="on"/>
      <vapic state="on"/>
      <spinlocks state="on" retries="8191"/>
      <vendor_id state="on" value="bupkis"/>
    </hyperv>
    <kvm>
      <hidden state="on"/>
    </kvm>
</hyperv>
```

- Change the cpu mode to host passthrough:

```
<cpu mode="host-passthrough" check="none"/>
```

- Add a shem device right before the end of the devices block:

```
<shmem name="looking-glass">
      <model type="ivshmem-plain"/>
      <size unit="M">32</size>
      <address type="pci" domain="0x0000" bus="0x0b" slot="0x01" function="0x0"/>
</shmem>
```

- Add some qemu commands to obfuscate virtualization and escape code 43 error:

```
<qemu:commandline>
    <qemu:arg value="-cpu"/>
    <qemu:arg value="host,hv_time,kvm=off,hv_vendor_id=null"/>
    <qemu:env name="QEMU_AUDIO_DRV" value="pa"/>
    <qemu:env name="QEMU_PA_SERVER" value="/run/user/1000/pulse/native"/>
</qemu:commandline>
```

## Post-install configuration
There are several things that need to be modifed after the installation is finished for Looking Glass to work. 

- Perform the relevant steps in the [Looking Glass installation](https://looking-glass.hostfission.com/wiki/Installation)
- Remove the tablet spice device (breaks virutalized mouse input)
- Remove video spice device (can conflict and cause windows to display a "skeleton" of itself). This can also happen with display vs. hdmi.
- Remove any other unwannted hardware
- Add only the first two devices of the GPU (the actual GPU and HD audio), but leave out the USB-C controller.
