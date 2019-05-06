# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Don't greet
set fish_greeting

set fish_color_normal white
set fish_color_command blue --bold
set fish_color_autosuggestion white
set fish_color_param cyan
set fish_color_error red
set fish_color_quote cyan
set fish_color_end white
set fish_color_redirection white
set fish_color_operator red
