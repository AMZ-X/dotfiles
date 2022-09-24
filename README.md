# dotfiles

[![Actions Status](https://github.com/amz-x/dotfiles/workflows/DotfilesCI/badge.svg)](https://github.com/amz-x/dotfiles/actions)

Personal dotfiles on Fedora Linux 37 with ZSH & ZPM.

## Features

### Applications

- Google Chrome Stable
- Slack
- Discord
- Simplenote
- DBeaver
- Steam (WIP)

### Development Tools

- Visual Studio Code
- Android Studio
- Docker
- KVM / QEMU
- NET Core 6
- Python 3
- Vala
- Meson
- RPM Packaging
- Nix (WIP)

## Installation

### Setup Requirements

Requirements for installation setup on Fedora

- Fedora Workstation ISO
- Git
- Ansible

### Setup

Install Fedora Workstation

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
ansible-playbook -K ./playbook.yml --connection=local --inventory 127.0.0.1, --limit 127.0.0.1
```

### Development Setup

Prerequisites

- python3
- python3-devel
- python3-pip
- python3-virtualenv

Setup (with via Bash shell)

```bash
virtualenv .virtenv && source .virtenv/bin/activate && pip3 install -r requirements.txt
```

### Testing

```bash
cd ./setup
molecule test
```
