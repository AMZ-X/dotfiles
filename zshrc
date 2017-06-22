#
# ~/.zshrc
#
# ZSH - User configuration
#

# LANG
export LANG=en_US.UTF-8

# EDITOR
export EDITOR=vim

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Antigen #
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles (add-ons / plugins)
antigen bundle pacman
antigen bundle git
antigen bundle npm
antigen bundle python
antigen bundle pip
antigen bundle django
antigen bundle command-not-found

# Theme
antigen theme frmendes/geometry

# Apply
antigen apply
