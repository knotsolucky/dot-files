# Starship Setup
eval "$(/home/linuxbrew/.linuxbrew/bin/starship init zsh)"


# Zoxide Setup
eval "$(zoxide init --cmd cd zsh)"

# History Setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# WSL / Linux Specific Configuration
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Eza (Enhanced ls Command)
alias ls="eza --icons=always"

# FZF (Fuzzy Finder) Configuration
alias fzf='fzf --bind "enter:execute(nvim {})"'

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# Homebrew Configuration
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

