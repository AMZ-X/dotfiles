# Default
bass source /etc/profile

# SHELL
set --export    SHELL                                   "/usr/bin/fish"

# LANG
set --export    LANG                                    "en_US.UTF-8"

# EDITOR
set --export    EDITOR                                  "nano"

# SSH
set --export    SSH_KEY_PATH                            "$HOME/.ssh/rsa_id"

# GDK
# set --export    GDK_SCALE                               "2"
# set --export    GDK_DPI_SCALE                           "0.50"

# ANDROID & ANDROID HOME
set --export    ANDROID                                 "$HOME/Android"
set --export    ANDROID_HOME                            "$ANDROID/Sdk"

# JAVA HOME
set --export    JAVA_HOME                               "/usr/lib/jvm/java-1.8.0-openjdk"

# SDL
set --export    SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS        "0"

# ANDROID HOME / SDK Path
set -gx PATH    "$ANDROID_HOME/tools"                   $PATH;
set -gx PATH    "$ANDROID_HOME/tools/bin"               $PATH;
set -gx PATH    "$ANDROID_HOME/platform-tools"          $PATH;
set -gx PATH    "$ANDROID_HOME/emulator"                $PATH;

# JAVA Path
set -gx PATH    "$JAVA_HOME/bin"                        $PATH;

# .NET Core Tools Path
set -gx PATH    "$HOME/.dotnet/tools"                   $PATH;

# Azure Functions CLI Path
set -gx PATH    "$HOME/.azure/azure-functions-cli"      $PATH;

# MSSQL Server & Tools Path
set -gx PATH    "$PATH:/opt/mssql/bin"                  $PATH;
set -gx PATH    "$PATH:/opt/mssql-tools/bin"            $PATH;

# Aliases
alias spec-deps  "sudo dnf builddep"
alias spec-fetch "spectool -g -R"
alias spec-build "rpmbuild -ba"