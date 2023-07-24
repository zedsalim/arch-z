<br />
<div align="center">
  <a href="https://github.com/zedsalim/arch-z">
    <img src="[ign]/logo.png" alt="Logo" width="70%">
  </a>

<h3 align="center">Arch Minimal Setup with i3</h3>

<p align="center">
    Automate and Style Your Arch System with Arch-Z!
    <br />
</div>

## About The Project

- **WM:** [i3-gaps](https://github.com/Airblader/i3)
- **OS:** [Arch Linux](https://archlinux.org)
- **Terminal:** [kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [bash](https://wiki.archlinux.org/title/Bash)
- **Status Bar:** [polybar](https://github.com/polybar/polybar)
- **Compositor:** [picom](https://github.com/ibhagwan/picom)
- **Editor:** [neovim](https://github.com/neovim/neovim)
- **Browser:** [Chromium](https://github.com/chromium/chromium)
- **File Manager:** [pcmanfm](https://github.com/lxde/pcmanfm)
- **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

This project is a shell script that automates the post installation process for a minimal Arch system, along with the i3 window manager. It aims to provide an easy and efficient way to configure an arch desktop environment with a Stylish lightweight and customizable window manager.

The script installs the necessary packages and applications required for daily drive and a functional and beutiful i3wm setup, and other recommended utilities. It also configures various system settings to optimize the user experience and provides a clean minimal and stylish i3 configuration.

## Previews

![Screenshot 1](%5Bign%5D/s1.png)
![Screenshot 2](%5Bign%5D/s2.png)
![Screenshot 3](%5Bign%5D/s3.png)
![Screenshot 4](%5Bign%5D/s4.png)

______________________________________________________________________

## Pre-Installation

To use this script and set up your Arch system with my i3 config, follow these steps:

1. Install a fresh minimal Arch system. You can download the ISO from the official [Arch website](https://archlinux.org/).

1. Once the base system is installed:

### Install git and vim (or your favorite text editor)

```bash
sudo pacman -S git vim
```

### Clone this repo

```bash
git clone https://github.com/zedsalim/arch-z
cd arch-z
ls
.git   config  optional  1-software.sh  3-fonts.sh  README.md
[ign]  fonts   theme     2-setup.sh     4-rice.sh   run_me.sh
```

### Categorization of the directories and the scripts

1. Scripts:\
   1-software.sh: A script responsible for install all the softwares and the packages needed for a minimal Arch system, **(you must see what inside it and you can custumize it as you need)**.\
   2-setup.sh: A script that handles the initial setup of the i3wm environment and the Display Manager.\
   3-fonts.sh: A script for font configuration and installation.\
   4-rice.sh: A script that performs further customization or "ricing" of Arch-Z i3wm environment.\
   run_me.sh: A script meant to be executed to apply the configurations and setups provided by other scripts **(this is the only script you need to run)**

1. Directories **(Do not modify)**:\
   config: The configuration file for the Arch-Z setup.\
   fonts: A directory containing font files used in the Arch-Z configuration.\
   theme: A directory with theme-related files.\
   optional: A folder containing optional configuration files and scripts that are not necessary for the basic setup (check them out).

1. Other Files **(Delete them if you want)**:\
   README.md: A Markdown file serving as the main documentation or guide for this project.\
   \[ign\]: A folder that contains Essential Files for the README.md.

**_Please note that the directories are marked as "Do not modify" to indicate that they contain important files and resources that should not be altered unless you have specific knowledge or intention to modify them._**

## Installation

**To install this setup, simply run ./run_me.sh, enter your password, and wait for the installation to complete.**

```bash
./run_me.sh
```

## Usage

- Press Super + Shift + h to view the Guide and read it all.
- NOTE: The 'Super' Key is the 'Windows' Key

## Keybindings:

### System Keybindings:

- super + shift + h: Opens the Arch-Z Guide
- super + shift + r: Restarts the i3 window manager
- super + q: Closes the current window
- super + f: Toggles fullscreen mode for the current container
- super + shift + f: Toggles floating mode for the current container
- super + shift + b: Reboots the system
- super + shift + s: Shuts down the system

### Application Keybindings:

- super + Return (Enter): Launches kitty terminal
- super + shift + Return (Enter): Launches kitty terminal in scratchpad mode
- super + p: Opens rofi application
- super + n: Opens pcmanfm file manager
- super + r: Opens ranger file manager
- super + c: Launches VSCode
- super + w: Launches Chromium
- Print (Impr écran Syst): Opens flameshot screenshot tool (GUI mode)

### Workspace Keybindings:

- super + \[1->9,0\]: Switches to the specified workspace
- super + shift + \[1->9,0\]: Moves the current container to the specified workspace

### Window Movement Keybindings:

- super + \[h, j, k, l\]: Focuses on the window in the specified direction
- super + shift + \[h, j, k, l\]: Moves the window in the specified direction
- super + \[Left, Down, Up, Right\]: Focuses on the window in the specified direction
- super + shift + \[Left, Down, Up, Right\]: Moves the window in the specified direction
- super + tab: Focuses on the last two workspaces back and forth

Discover more keybindings and info in [Arch-Z Guide](https://github.com/zedsalim/arch-z/blob/master/config/guide.pdf).
