# My config
set -g theme_date_format "+[%H:%M:%S]"
set -g theme_color_scheme dark
fish_vi_key_bindings

source ~/.aliases

zoxide init fish | source
starship init fish | source
