export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


# POWERLEVEL9K_MODE='nerdfont-complete'

ZSH_THEME="agnoster"
export DEFAULT_USER="$(whoami)"

# POWERLEVEL9K_OS_ICON_BACKGROUND="white"
# POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
# POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status command_execution_time background_jobs todo ram load rvm time)

# more prompt elements that are suggested
# (public_ip docker_machine pyenv nvm)          https://github.com/bhilburn/powerlevel9k#prompt-customization
# Note: using public_ip is cool but when connection is down prompt waits for 10-20 seconds

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh os_icon context dir rbenv vcs)

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true


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
DISABLE_AUTO_TITLE="true"

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
plugins=(
    git
    zsh-completions
    zsh-autosuggestions
    history-substring-search
    httpie
    docker
    pip
    pyenv
    screen
    systemd
    k
    poetry
    # zsh-wakatime          # enable if you use wakatime with 'https://github.com/wbingli/zsh-wakatime'
    # zsh-syntax-highlighting   # Runs horrible on WSL
    )
#plugins+=(zsh-nvm)

source $ZSH/oh-my-zsh.sh

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

# Add to PATH to Install and run programs with "pip install --user"
export PATH=$PATH:~/linux-dev/dotfiles
export PATH=$PATH:~/.local/bin

NPM_PACKAGES="${HOME}/.npm"
PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export MARKER_KEY_NEXT_PLACEHOLDER="\C-b"   #change maker key binding from Ctr+t to Ctr+b

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

export PATH=$PATH:~/.quickzsh/todo/bin    #usig alias doesn't properly work

autoload -U compinit && compinit        # zsh-completions
# autoload bashcompinit                 # bash completions
# bashcompinit


# CUSTOM ALIASES
export COOKIECUTTER_CONFIG="/home/hayden/linux-dev/dotfiles/.cookiecutter/cookiecutter.yaml"

SAVEHIST=10000     #save upto 50,000 lines in history. oh-my-zsh default is 10,000
#setopt hist_ignore_all_dups     # dont record duplicated entries in history during a single session

# My Aliases

# Start stuff that downloads in ~/Downloads
alias wget="cd ~/Downloads; wget"
alias zsh-pull="cd /home/hayden/linux-dev; git pull; cd -; zsh"

# Shortcut to making exicutable.
alias plusx="chmod +x"

# Python
alias activate="source ./.venv/bin/activate"
# alias pip=pip3
# alias python=python3.9

# Custom Apt
alias app="sudo apt-get"
alias app-remove="sudo apt-get remove"
alias app-install="sudo apt-get install"
alias app-edit="sudo envedit /etc/apt/sources.list"
alias app-search="apt-cache --names-only search"
alias app-search-all="apt-cache search"
alias app-update="sudo apt-get update && sudo apt-get upgrade"
alias app-info="apt-cache showpkg"



# Stuff That Came With Template
alias myip="wget -qO- https://wtfismyip.com/text"	# quickly show external ip address
alias l="ls -lah"
alias x="exit"
alias k="k -h"						# show human readable filesizes, in kb, mb etc



# CUSTOM FUNCTIONS

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Opens Last lf Directory in VSCode
lfcode () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && code "$dir"
    fi
}
bindkey -s '^[c' 'lfcode\n'

# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}

# Matrix screen saver! will run if you have installed "cmatrix"
# TMOUT=900
# TRAPALRM() { if command -v cmatrix &> /dev/null; then cmatrix -sb; fi }

speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}



# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl "http://api.db-ip.com/v2/free/$1"
    else
        curl "http://api.db-ip.com/v2/free/$(myip)"
    fi
}


