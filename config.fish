# My config
set -g theme_date_format "+[%H:%M:%S]"
set -g theme_color_scheme dark
fish_vi_key_bindings

# Load SSH keys
if status --is-interactive
    set -lx SHELL fish
    keychain --eval --agents ssh --quiet -Q id_rsa | source
end

# Environment variables
set -Ux PATH $PATH $HOME/.cargo/bin
set -Ux EDITOR hx
set -Ux JAVA_HOME '/usr/lib/jvm/java-8-openjdk'
set -Ux PATH $JAVA_HOME/bin $PATH
set -Ux TERM xterm-256color

# Aliases
source ~/.aliases

# Allows to open a path as a new terminal
function open
    set -l path (realpath $argv)
    if test -d $path
        alacritty --working-directory $path &
    else
        # Use xdg-open for the fallback
        xdg-open $argv
    end
end

zoxide init fish | source
starship init fish | source
