# DotFiles #

.dotfiles on Arch Linux

## Setup ##

### Prerequisites ###
````
- git
- zsh
- zsh-completions (optionally)
````

### Installation ###

1.Create a user with ZSH
```
  [root] $ useradd -m -g users -G wheel,storage,power -S /bin/zsh {user}
```

2.Set the user's password
```
  [root] $ passwd {user}
```

3.Give user group [wheel] sudo permission by uncommenting line "%wheel ALL=(ALL) ALL"
```
  [root] $ EDITOR=nano visudo
```

4.Log in with above created user and execute installation script(s)
```  
  [{user}] $ ./SETUP/system_config.sh

  ## AND / OR ##

  [{user}] $ ./SETUP/config_setup.sh
```

## Todo ##
- Power Management / Screen timeout
