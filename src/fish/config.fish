# Default
bass source /etc/profile

# SHELL
set -gx SHELL                               "/usr/bin/fish"

# LANG
set -gx LANG                                "en_US.UTF-8"

# EDITOR
set -gx EDITOR                              "nano"

# SSH
set -gx SSH_KEY_PATH                        "$HOME/.ssh/rsa_id"

# SDL
set -gx SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS    "0"

# JAVA
set --export JAVA_HOME                      "/usr/lib/jvm/java-1.8.0-openjdk"

set -gx PATH $JAVA_HOME/bin                 $PATH;

# ANDROID
set --export ANDROID                        "$HOME/Android"
set --export ANDROID_HOME                   "$ANDROID/Sdk"

set -gx PATH $ANDROID_HOME/tools            $PATH;
set -gx PATH $ANDROID_HOME/tools/bin        $PATH;
set -gx PATH $ANDROID_HOME/platform-tools   $PATH;
set -gx PATH $ANDROID_HOME/emulator         $PATH;

# # ANDROID PATH
# set -U PATH "$PATH:$ANDROID_HOME"
# set -U PATH "$PATH:$ANDROID_HOME/emulator"
# set -U PATH "$PATH:$ANDROID_HOME/platform-tools"
# set -U PATH "$PATH:$ANDROID_HOME/tools"
# set -U PATH "$PATH:$ANDROID_HOME/tools/bin"

# JAVA PATH
# set PATH "$PATH:$JAVA_HOME"
# set PATH "$PATH:$JAVA_HOME/bin"

# .NET Core Path
set PATH "$PATH:$HOME/.dotnet/tools"

# MSSQL Server & Tools Path
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

# Aliases
alias spec-deps  "sudo dnf builddep"
alias spec-fetch "spectool -g -R"
alias spec-build "rpmbuild -ba"