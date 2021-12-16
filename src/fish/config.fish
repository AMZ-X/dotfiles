# Default
bass source /etc/profile

# LANG
set -gx LANG            "en_US.UTF-8"

# EDITOR
set -gx EDITOR          "nano"

# SSH
set -gx SSH_KEY_PATH    "$HOME/.ssh/rsa_id"

# DOTNET ROOT
set -gx DOTNET_ROOT     "$HOME/.dotnet"

# .NET Core Path
set PATH "$PATH:$DOTNET_ROOT"
set PATH "$PATH:$DOTNET_ROOT/tools"

# MSSQL Server & Tools
set PATH "$PATH:/opt/mssql/bin"
set PATH "$PATH:/opt/mssql-tools/bin"

# RVM Path
set PATH "$PATH:$HOME/.rvm/bin"

# RVM Config
set rvm_path "$HOME/.rvm/"
set rvm_make_flags "-j8"
set rvm_silence_path_mismatch_check_flag 1

# RVM init
rvm default
