# dotfiles

Personal dotfiles on Fedora Linux with dotbot & ansible.

![Screenshot](https://github.com/amz-x/dotfiles/raw/master/data/screenshot.png "Personal - Fedora 30 - Pantheon Desktop")

## Prerequisites

Packages that are required for automatic setup

- git
- ansible

## Installation: Automatic via Ansible

```bash
#!/bin/bash
$ sudo dnf install ansible git -y
$ ansible-playbook -K ./setup.yml
```

## Installation: Maunal (ZSH Setup only)

```bash
#!/bin/bash
$ curl -sL git.io/antibody | sh -s
```

As non-root user install zsh, change shell to zsh and execute install in root of project

```bash
#!/bin/bash
$ sudo dnf -y install zsh
$ chsh -s $(which zsh)
$ ./install
```

## Future

- Replace oh-my-zsh with sane defaults, for example dotphiles or something
