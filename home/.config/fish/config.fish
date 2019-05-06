# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Don't greet
set fish_greeting

set fish_color_command blue --bold
set fish_color_autosuggestion white
set fish_color_param blue
set fish_color_error red
