# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# if got garbash character display ,config font/coding in your terminal preference!
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnosterzak"
plugins=(
  git
  cabal
  sbt
  idris
  archlinux
  sudo
  zsh-autosuggestions
  ag
)

source $ZSH/oh-my-zsh.sh
alias gcamp="ga . ; gcam '+' ; gp"
zstyle ":completion:*:commands" rehash 1
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"

# make danger cmds safer:
# TERMINAL SAFETY SHIELDS (Prevents Accidental Data Deletion)

# 1. Basic File Utilities: Prompt before overwriting or wiping data
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I --preserve-root' # -I prompts only for 3+ files; protects root (/)


# 3. Intercept and guard dangerous Git & Rsync actions
git() {
    # Guard against 'git reset --hard' wiping uncommitted work
    if [[ "$1" == "reset" && "$*" == *"--hard"* ]]; then
        echo "⚠️  WARNING: 'git reset --hard' will permanently wipe uncommitted code."
        read -p "Are you absolutely sure you want to lose local changes? (y/n): " choice
        [[ "$choice" != "y" ]] && { echo "❌ Reset canceled."; return 1; }
    fi
    command git "$@"
}

rsync() {
    # Guard against 'rsync --delete' wiping out directories blindly
    if [[ "$*" == *"--delete"* ]]; then
        echo "⚠️  CRITICAL: Your command contains '--delete'."
        echo "Running a safe --dry-run simulation first..."
        echo "------------------------------------------------------------"
        command rsync "$@" --dry-run
        echo "------------------------------------------------------------"
        read -p "Simulation finished. Execute the real sync? (y/n): " choice
        [[ "$choice" != "y" ]] && { echo "❌ Aborted. No files were changed."; return 1; }
    fi
    command rsync "$@"
}

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# powerline-daemon -q
# . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

