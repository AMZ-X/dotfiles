# dotfiles

[![Actions Status](https://github.com/amz-x/dotfiles/workflows/DotfilesCI/badge.svg)](https://github.com/amz-x/dotfiles/actions)

Personal dotfiles on Fedora Linux with Ansible & Molecule.

![Screenshot](https://github.com/amz-x/dotfiles/raw/master/data/screenshot.png "Personal - Fedora 30 - Pantheon Desktop")

## Features

- Fedora 30
- ZSH
- Antibody
- NVM (Node Version Manager)
- Pantheon Desktop
- Visual Studio Code

## Additional Development Features

- Docker
- QEMU
- Vala
- LAMP
- PHP 7.1
- PHP 7.3
- .NET Core 2.2
- .NET Core 3.0
- .NET Core 3.1

## Installation

### Setup Requirements

Requirements for installation setup on Fedora 30

- [fedora 30 xfce spin](https://dl.fedoraproject.org/pub/fedora/linux/releases/30/Spins/x86_64/iso/Fedora-Xfce-Live-x86_64-30-1.2.iso)
- unzip (if downloading)
- ansible

### Setup

Install Fedora 30 Xfce

Install ansible & git

```bash
sudo dnf install ansible git unzip -y
```

Download from Source

```bash
wget https://github.com/amz-x/dotfiles/archive/master.zip
```

Extract it

```bash
unzip master.zip -d dotfiles
```

### Installing

In root directory of project

```bash
cd ./setup/molecule/default
ansible-playbook -K ./playbook.yml --connection=local --inventory 127.0.0.1, --limit 127.0.0.1
```

### Development Setup

Prerequisites

- python3
- python3-devel
- python3-pip
- python3-virtualenv

Setup

```bash
virtualenv .virtenv && source .virtenv/bin/activate && pip3 install -r requirements.txt
```

### Testing

```bash
cd ./setup
molecule test
```
