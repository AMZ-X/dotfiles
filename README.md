# dotfiles

Personal dotfiles on Fedora Linux with dotbot & ansible.

## Prerequisites

Packages that are required for automatic setup
- git
- ansible

## Installation: Automatic via Ansible
```
$ sudo dnf install ansible git -y
$ ansible-playbook -K ./setup.yml
```

## Installation: Maunal (ZSH Setup only)
```
$ curl -sL git.io/antibody | sh -s
```

As non-root user install zsh, change shell to zsh and execute install in root of project

```
$ sudo dnf -y install zsh
$ chsh -s $(which zsh)
$ ./install
```

## Future
- Replace oh-my-zsh with sane defaults, for example dotphiles or something
