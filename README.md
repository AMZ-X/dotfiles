# dotfiles

Personal dotfiles on Fedora Linux with dotbot.

## Table of Contents
- [Setup](#system-setup)
- [Configuration](#configuration)
- [ZSH User](#zsh-user)
- [Dotfiles](#installation)

## Prerequisites
Antibody needs to be installed, before continuing with the setup. This could be done in one or two ways:

1. Repo (Recommended)
```
$ sudo copr enable amz/extras -y
$ sudo dnf update --refresh -y
$ sudo dnf install -y antibody 
``` 

2. Simple 
```
$ curl -sL git.io/antibody | sh -s
```

## Setup

As non-root user install zsh, change shell to zsh and execute install in root of project

```
$ sudo dnf -y install zsh
$ chsh -s $(which zsh)
$ ./install
```

## TODO
- Replace oh-my-zsh with sane defaults, for example dotphiles or something
