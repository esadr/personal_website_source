---
title: "How to Install RTX 5070 on Ubuntu 24.04 with KDE Plasma (X11)"
date: 2025-03-30
authors: 
    - Ehsan
tags: 
- Driver
- Desktop
comments: true
image: 
    caption: 'Image credit: [**Unsplash**](https://unsplash.com)'
---
# How to Install RTX 5070 on Ubuntu 24.04 with KDE Plasma (X11)

If you recently built a system with an NVIDIA RTX 50-series GPU and are running Ubuntu 24.04 (Oracular), you might find the out-of-the-box experience... underwhelming. No display, no desktop, and `nvidia-smi` throwing cryptic errors. Been there. Here's how I finally got everything working, including KDE Plasma on X11.

This post documents the final working steps I took, including why each part is necessary. Whether you're installing from scratch or debugging a broken setup, this is for you.

---

## ⚡ Step 1: Install a Newer Linux Kernel

**Tool used**: `mainline` (Ubuntu Mainline Kernel Installer)

**Why**: Ubuntu 24.04 ships with a kernel that may not fully support NVIDIA's newest drivers for RTX 50-series cards (Blackwell architecture). Installing a newer kernel (I used `6.12.20`) was necessary to get the NVIDIA driver to compile.

There are newer versions of kernels in `mainline`, and in the future those may work even better with newer versions of NVIDIA's driver. You can list the available versions using:

```bash
mainline list | less
```

To install the tool and a compatible kernel:

```bash
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install mainline -y
```

Then install the newer kernel version: (I chose 6.12.20 for now)

```bash
sudo mainline install 6.12.20
```

After installation, reboot and select the new kernel via GRUB. You can check which one you're running:

```bash
uname -r
# Should say: 6.12.20-061220-generic
```

---

## 🚗 Step 2: Install NVIDIA Driver (Open Kernel Modules)

**Package**: `nvidia-driver-570-open`

**Why**: This version supports the RTX 5070 and newer kernels. The "open" version uses the newer open-source kernel modules, improving compatibility with custom kernels.

```bash
sudo apt install nvidia-driver-570-open -y
```

After installation, reboot again. Then verify with:

```bash
nvidia-smi
```

You should see your GPU info without errors.

---

## 🌐 KDE Plasma (X11) Setup

I like KDE Plasma with X11 so here is how to install those. I find some packages are missing and I had to install them manually.

### 🧱 Install KDE Minimal + Plasma Desktop

```bash
sudo apt install kde-plasma-desktop -y
```

Log into Plasma using **X11** (not Wayland).

### 🛠 Add Missing KDE System Apps

Some KDE modules like mouse or display settings weren't installed by default. Add them manually:

```bash
sudo apt install systemsettings kde-cli-tools plasma-systemmonitor kscreen -y
```

This includes:

- **systemsettings**: Core KDE settings hub
- **kde-cli-tools**: Required for settings modules to work properly
- **plasma-systemmonitor**: Resource monitor
- **kscreen**: Display and monitor configuration tool

---

## ✅ Verify the Desktop Session

Make sure you're on X11 (not Wayland):

```bash
echo $XDG_SESSION_TYPE
# Output should be: x11
```

---

## 🚀 Conclusion

After these steps, I had a fully working desktop:

- Kernel `6.12.20`
- NVIDIA driver `570.124.04`
- KDE Plasma running on X11

Everything from display configuration to CUDA acceleration via `nvidia-smi` works as expected. I hope this helps someone else navigating the rocky path of bleeding-edge hardware on Linux!
