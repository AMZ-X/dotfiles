# dotfiles

Personal dotfiles on Fedora Linux with dotbot & ansible.

![Screenshot](https://github.com/amz-x/dotfiles/raw/master/data/screenshot.png "Personal - Fedora 30 - Pantheon Desktop")

## Features
- Fedora 30
- ZSH
- Antibody
- Pantheon
- Visual Studio Code
- NVM (Node Version Manager)
- LAMP
- PHP 7.1
- PHP 7.3
- Dot NET Core 3

## Prerequisites

Packages that are required for automatic setup

- fedora 30 (XFCE variant)
- git
- ansible
- unzip

## Setup:

Install Fedora 30 Xfce

Install ansible & git
```bash
$ sudo dnf install ansible git unzip -y
```

Download from Source
```bash
$ wget https://github.com/amz-x/dotfiles/archive/master.zip
```

Extract it 
```bash
$ unzip master.zip -d dotfiles
```

## Installation: 

```bash

$ ansible-playbook -K ./setup.yml
```

## Future

- Replace oh-my-zsh with sane defaults, for example dotphiles or something
