# dotfiles

Personal dotfiles on Arch Linux with dotbot.

## Table of Contents
- [Setup](#system-setup)
- [Configuration](#configuration)
- [ZSH User](#zsh-user)
- [Dotfiles](#installation)


## Setup

Install ZSH:
```
$ sudo install zsh zsh-completions
```

## Configuration

Uncomment `%wheel ALL=(ALL) ALL` as root to allow members of group wheel to execute any command:
```
$ EDITOR=nano visudo
```

Make sudo available to 

## ZSH Setup
1. Create ZSH user (recommended):
```
$ sudo useradd -m -g users -G wheel,storage,power -S /bin/zsh $USER
$ sudo passwd $USER

```

2. Change shell:
```
$ sudo chsh /bin/zsh
``` 

## Dotfiles
Install dotfiles by executing ./install in root of project with sudo:
```
$ sudo ./install
```

## TODO
- DE Updates
- Theme
- Update system installation scripts