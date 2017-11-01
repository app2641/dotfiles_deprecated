# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# path
PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
export GOPATH="$HOME/Documents/GoProjects"

# alias
alias alc='alc-cmd s'
alias be='bundle exec'
alias date='gdate'
alias db:st='bin/rake db:migrate:status'
alias db:up='bin/rake db:migrate'
alias db:down='bin/rake db:rollback'
alias dm='docker-machine'
alias dc='docker-compose'
alias g='hub'
alias grep='ggrep'
alias ls='exa'
alias pullreq='hub compare'
alias rk='bin/rake'
alias rs='bin/rspec'
alias sch='ps ax | ag '
alias sp='bin/spring'
alias sprk='bin/spring rails'
alias sprs='bin/spring rspec -fd'
alias t='tmux'
alias tls='tmux ls'
alias ta='tmux attach-session -t '
alias up='cd ../'
alias upp='cd ../../'
alias zssh="$GOPATH/bin/zssh"

# function
function start_redis () {
    redis-server /usr/local/etc/redis.conf
}

function start_postgres () {
    postgres -D /usr/local/var/postgres
}

function start_monit () {
    sudo monit -c /etc/monit/monitrc
}

function greset () {
    git reset --hard
}

function plrb () {
    git pull --rebase origin `git rev-parse --abbrev-ref HEAD`
}

# function gls () {
    # git ls-files | ag $1
# }

# function docker_host () {
    # docker-machine env default | ag tcp | sed -e 's/[^:.0-9]//g' -e 's/^://' -e 's/:.*//'
# }

# function start_kibana () {
    # kibana -e http://`docker_host`:9200 -c ~/.kibana.yml
# }

# function open_kibana () {
    # open http://`docker_host`:5601
# }

function psk () {
    sch $1 | cut -f 1 -d ' ' | xargs kill
}

function update_master () {
    g ch master && g ft && plrb && bundle install
}

function update_db () {
    db:up && db:up RAILS_ENV=test && g ch db/schema.rb
}

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# fuck
eval $(thefuck --alias)

# docker-machine
# eval "$(docker-machine env default)"

# go
export PATH="$PATH:$HOME/Documents/GoProjects/bin"

# zssh
eval "$($GOPATH/bin/zssh --zsh-completion)"

# direnv
eval "$(direnv hook zsh)"

# prompt
export ZSH_THEME_GIT_PROMPT_DIRTY="✗"
export ZSH_THEME_GIT_PROMPT_CLEAN=""
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

RABBIT=$'\U1F430'
BEAR=$'\U1F43B'
DOG=$'\U1F436'
ERROR=$'\U1F363'
export PS1="
%F{green}[%{%}%~%{%}]%f%F{cyan}\$(parse_git_branch)%f %F{yellow}\$(parse_git_dirty)%f
%(?|%{%}${RABBIT} ${BEAR} ${DOG} |%{%}${ERROR} ${ERROR} ${ERROR} )%{%} %{%}"

# ssh先のシェルで日本語を使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
