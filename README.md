# dotfiles

[![Actions Status](https://github.com/amz-x/dotfiles/workflows/DotfilesCI/badge.svg)](https://github.com/amz-x/dotfiles/actions)

Personal dotfiles on Fedora Linux with dotbot & ansible.

![Screenshot](https://github.com/amz-x/dotfiles/raw/master/data/screenshot.png "Personal - Fedora 30 - Pantheon Desktop")

## Features
- Fedora 30
- ZSH
- Antibody
- Pantheon Desktop
- Visual Studio Code
- Docker
- QEMU
- Vala
- NVM (Node Version Manager)
- LAMP
- PHP 7.1
- PHP 7.3
- .NET Core 3

## Prerequisites

Packages that are required for automatic setup installation

- fedora 30 (XFCE variant)
- git
- ansible
- unzip

Development

- python3-virtualenv
- docker

## Setup

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

## Developement Setup

```bash
$ virtualenv .env && source .env/bin/activate && pip3 install -r requirements.txt
```

## Scripts

### Installation 

In root directory of folder
```bash

$ ansible-playbook -K ./setup.yml --tags=setup
```

### Cleanup 

Cleaup unused packages
```bash

$ ansible-playbook -K ./setup.yml --tags=cleaup
```
