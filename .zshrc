# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt auto_cd              # cd by typing directory name
setopt hist_ignore_dups     # Don't store duplicate commands in history
setopt share_history        # Share history between all sessions
setopt inc_append_history   # Append to history file immediately

alias x="exit"
alias cls="clear"
alias reload="source ~/.zshrc"
alias hc="warp-cli connect"
alias hg="warp-cli disconnect"

alias ls='ls -G'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias grep='grep --color=auto'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gs='git status'
alias gp='git push'
alias gpull='git pull'

mkcd() {
  mkdir -p "$1" && cd "$1"
}

export DEFAULT_USER="$USER"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/Users/dhruvdugar/.antigravity/antigravity/bin:$PATH"

#-----------------------------------------------------------------------
# INITIALIZATIONS
#-----------------------------------------------------------------------
# Powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Z (https://github.com/rupa/z)
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Conda
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dhruvdugar/Downloads/enter/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dhruvdugar/Downloads/enter/etc/profile.d/conda.sh" ]; then
        . "/Users/dhruvdugar/Downloads/enter/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dhruvdugar/Downloads/enter/bin:$PATH"
    fi
fi
unset __conda_setup

# NVM (Node Version Manager)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Pyenv
eval "$(pyenv init --path)"

# Fig
[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

#-----------------------------------------------------------------------
# COMPLETIONS
#-----------------------------------------------------------------------
# NVM bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Angular CLI autocompletion
source <(ng completion script)

# Zsh Highlighting (from original .zshrc)
# Note: This requires `zsh-syntax-highlighting` to be installed.
# You can install it with: brew install zsh-syntax-highlighting
# Then add `source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
