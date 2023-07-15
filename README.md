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
- **Browser:** [Brave](https://github.com/brave/brave-browser)
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

### Window Manager Keybindings:

- super + shift + h: Opens the this Guide
- super + Escape: Reloads sxhkd config
- super + shift + c: Reloads the i3 window manager configuration
- super + shift + r: Restarts the i3 window manager
- super + shift + q: Exits i3 window manager
- super + q: Closes the current window

### Application Keybindings:

- super + Return (Enter): Launches kitty terminal
- super + shift + Return (Enter): Launches alacritty terminal in scratchpad mode
- super + p: Opens rofi application
- alt + w: Opens rofi (show mode)
- super + n: Opens pcmanfm file manager
- super + r: Opens ranger file manager
- super + c: Launches VSCode
- super + w: Launches Brave Browser
- super + s: Launches FileZilla
- super + t: Launches Telegram Desktop
- Print (Impr écran Syst): Opens flameshot screenshot tool (GUI mode)

### Audio Keybindings:

- XF86AudioMute: Toggles audio mute
- XF86AudioLowerVolume: Decreases audio volume by 5%
- XF86AudioRaiseVolume: Increases audio volume by 5%

### Brightness Keybindings:

- XF86MonBrightnessDown: Decreases audio volume by 10%
- XF86MonBrightnessUp: Increases audio volume by 10%

### i3 Window Manager Keybindings:

- super + v: Splits the current container vertically
- super + h: Splits the current container horizontally
- super + f: Toggles fullscreen mode for the current container
- super + shift + f: Toggles floating mode for the current container
- super + control + space: Toggles focus between tiling and floating mode
- super + alt + a: Focuses on the parent container
- alt + shift + s: Change container layout to stacked
- alt + shift + t: Change container layout to tabbed
- alt + shift + e: Change container layout to toggle split

### Workspace Keybindings:

- super + \[1->9,0\]: Switches to the specified workspace
- super + shift + \[1->9,0\]: Moves the current container to the specified workspace

### Window Movement Keybindings:

- super + \[h, j, k, l\]: Focuses on the window in the specified direction
- super + shift + \[h, j, k, l\]: Moves the window in the specified direction
- super + \[Left, Down, Up, Right\]: Focuses on the window in the specified direction
- super + shift + \[Left, Down, Up, Right\]: Moves the window in the specified direction
- super + tab: Focuses on the last two workspaces back and forth

### Additional Keybindings:

- alt + x: Opens ranger in ~/Downloads/Watch (Where I keep all the courses and videos I need to learn from), (not created by default)
- alt + c: Opens the config files that I edit frequently
- alt + b: Opens my bookmarks (add yours inside ~/config/bookmarks.txt)
- alt + s: Opens my Work/Studies Schedule (Create your own schedule in ~/Pictures/schedule.png)
- alt + y: Runs the ~/.config/scripts/mpv-youtube.sh script that plays youtube videos using mpv (you must copy first the URL of a youtube video)
- alt + shift + y: Runs the ~/.config/scripts/web_blocker.sh script that temporarily blocks a specific website (Youtube by default)
- alt + shift + n: Runs the ~/.config/scripts/c/new_project.sh script to create a new C project
- alt + shift + o: Runs the ~/.config/scripts/c/old_project.sh to enter the existing C projects
- F1: Changing the wallpaper for the main monitor (Add your wallpapers in ~/.config/wallpapers/)
- F2: Changing the wallpaper for two monitors

### Gaps Keybindings:

- super + shift + n: Adjusts inner and outer gaps simultaneously
- super + x: Increases outer gaps by 5
- super + shift + x: Decreases outer gaps by 5
- super + z: Increases inner gaps by 5
- super + shift + z: Decreases inner gaps by 5
- super + ctrl + \[Left, Down, Up, Right\]: Resizes the current window

### System Keybindings:

- super + shift + b: Reboots the system
- super + shift + s: Shuts down the system
