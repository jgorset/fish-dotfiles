# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Don't greet
set fish_greeting "  - Hello" (whoami)

# Configure FZF
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Git aliases
alias gs "git status"
alias gc "git commit"
alias ga "git add"

# Use colorls instead of ls
alias ols "ls"
alias ls "colorls"

# Configure spacefish
set SPACEFISH_JOBS_SYMBOL \uf141
set SPACEFISH_JOBS_COLOR yellow
set SPACEFISH_JOBS_AMOUNT_THRESHOLD 100

# Go
set PATH ~/go/bin $PATH

# Configure colors
set fish_color_normal white
set fish_color_command blue
set fish_color_autosuggestion white
set fish_color_param cyan
set fish_color_error red
set fish_color_quote cyan
set fish_color_end white
set fish_color_redirection white
set fish_color_operator red
