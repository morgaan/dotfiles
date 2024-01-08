# export PATH=$HOME/bin:/usr/local/bin:$PATH Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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

# FYI oh-my-zsh includes now the zsh-z plugin
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)

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

DEFAULT_USER=`whoami`

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  export GIT_EDITOR=nvim
fi

if type /opt/neovim/neovim/bin/nvim > /dev/null 2>&1; then
  alias vim='/opt/neovim/neovim/bin/nvim'
  export GIT_EDITOR=/opt/neovim/neovim/bin/nvim
fi

if type /Users/morgan/nvim-macos/bin/nvim > /dev/null 2>&1; then
	alias vim='/Users/morgan/nvim-macos/bin/nvim'
  export GIT_EDITOR=/Users/morgan/nvim-macos/bin/nvim
fi

alias python='python3'
alias dc='docker-compose'

export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="$HOME/.nvm"
#  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# This is meant to source local specifics that aren't meant to be under source control
[ -f ~/.locals.zsh ] && source ~/.locals.zsh

source $HOME/superexport/.secretreader.sh
# source $HOME/superexport/.secretreader.sh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Notebook syncing
notes () {
  local notes_dir="$HOME/notebook/notes"
  case "$1" in
    h)
      printf "%s\n" "h: Help" "d: Change [d]irectory to notes folder" "i: Open wiki [i]ndex in vim" "p: [p]ersist: Stage, commit, push latest changes to git" "f: [f]etch: Pull from git"  
      ;;
    d)
      cd "$notes_dir/"
      ;;
    i)
      vim "$notes_dir/index.md"
      ;;
    p)
      pushd "$notes_dir"
      msg="Sync from $(hostname) on $(date -u '+%Y-%m-%d %H:%M:%S') UTC"
      git add .
      git commit -m "$msg"
      git push origin master
      popd
      ;;
    f)
      pushd "$notes_dir"
      git pull origin master
      popd
      ;;
  esac
}

# Vim mode in the command line
bindkey -v
export KEYTIMEOUT=1
# Bring back reverse history search in Vim mode
bindkey "^R" history-incremental-search-backward

# Shorter git worktree commands
wt () {
	case "$1" in
		an)
			git "wt$1" "$2" "$2"
			;;
		ar)
			git "wt$1" "$2" "$2" "origin/$2"
			;;
		r)
			git "wt$1" "$2"
			;;
		l)
			git worktree list
			;;
	esac
}

alias npm-show-wanted='npm outdated | awk '\''($2!=$3 && $1!="Package") {print $1":from:v"$2":to:v"$3}'\'' | column -t -s:'
alias npm-show-latest='npm outdated | awk '\''($3!=$4 && $1!="Package") {print $1":from:v"$2":to:v"$4}'\'' | column -t -s:'
alias npm-install-wanted='npm outdated | awk '\''($2!=$3 && $1!="Package") {print $1"@"$3}'\'' | paste -s -d" " - | xargs npm install'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
