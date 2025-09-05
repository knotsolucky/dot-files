# -- For Zoxide --
eval "$(zoxide init --cmd cd zsh)"

# -- Starship --
  eval "$(starship init zsh)"

## History Setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# MacOS
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# -- For Yazi --
export EDITOR="nvim"

# --- FZF ---
alias fzf='fzf --bind "enter:execute(nvim {})"'

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi" 

# bun completions
[ -s "/Users/habeebgiwa/.bun/_bun" ] && source "/Users/habeebgiwa/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

