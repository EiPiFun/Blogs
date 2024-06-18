# Introduction

This simple blog is to help nvidia optimus laptop user on GNU/Linux with proprietary nvidia display driver to use its dedicated nvidia gpu as primary gpu to render under X11.

# Tested distros

Debian  
Fedora/RHEL  
OpenSUSE  
Ubuntu  

## Tips

This blog is mainly for Debian and Fefora/RHEL.  
OpenSUSE and Ubuntu have its own tool called **prime-select**. If you are a user of one of them, you may use **prime-select** directly.

OpenSUSE:
```
sudo prime-select boot nvidia
sudo prime-select nvidia
```
Ubuntu:
```
sudo prime-select nvidia
```

# Configuration

1. Install nvidia proprietary driver from distro's repository (nonfree for debian/openSUSE/Ubuntu, rpmfusion for Fedora/RHEL, or nvidia's CUDA repository for all of them at https://developer.nvidia.com/cuda-downloads)  
2. Edit the xorg conf via vi/nano/gedit with root privilege and append the following to /etc/X11/xorg.conf.d/nvidia_as_primary.conf
```
Section "OutputClass"
         Identifier "nvidia"
         MatchDriver "nvidia-drm"
         Driver "nvidia"
         Option "PrimaryGPU" "yes"
EndSection
```
3. Reboot to test

# PRIME offload

If you do not want to use nvidia as primary gpu globaly or you want to use Wayland instead of Xorg, there is another way to offload some applications on the nvidia gpu.  
The only thing you need do is set three environment variables before run the application:

```
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only %command%
```

For example:

```
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only firefox
```

Enable gfx.x11-egl.force-enabled to true in Firefox about:config or set another environment variable MOZ_X11_EGL=1  
Games or Chrome could also be offloaded.  
However, Firefox has better hardware video decoding support comparing to chrome :)

# Reference

https://forums.developer.nvidia.com/t/debian-12-stable-kde-not-all-options-in-nvidia-settings-in-hybrid-mode-only-in-discrete-mode-can-see-more-options/278586  
https://docs.fedoraproject.org/en-US/quick-docs/set-nvidia-as-primary-gpu-on-optimus-based-laptops/  
https://wiki.archlinux.org/title/nvidia#Xorg_configuration  
https://wiki.debian.org/NVIDIA%20Optimus  

