# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
$HOME/.env

# rbenv
# eval "$(rbenv init - zsh)"
if [ -d ${HOME}/.rbenv ] ; then
    PATH=${HOME}/.rbenv/bin:${PATH}
    export PATH
    eval "$(rbenv init -)"
fi

# docker
# eval "$(docker-machine env default)"

source $ZSH/oh-my-zsh.sh

# prompt
export ZSH_THEME_GIT_PROMPT_DIRTY="%{[33m%}%  ✗"
export ZSH_THEME_GIT_PROMPT_CLEAN=""
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

DEFAULT=$'\U1F430 '
ERROR=$'\U1F363 '
export PS1="%{[0m%}
%{[32m%}%n %{[32m%}%~%{[32m%}\$(parse_git_dirty)
%(?|%{[36m%}${DEFAULT}|%{[31m%}${ERROR})%{[35m%}\$(parse_git_branch) %{[0m%}"

# export ZSH_THEME_GIT_PROMPT_DIRTY="✗"
# export ZSH_THEME_GIT_PROMPT_CLEAN=""
# function parse_git_branch() {
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
# }

# DEFAULT=$'\U1F430'
# ERROR=$'\U1F363'
# export PS1="
# %F{green}[%{%}%~%{%}]%f%F{cyan}\$(parse_git_branch)%f %F{yellow}\$(parse_git_dirty)%f
# %(?|%{%}${DEFAULT} ${DEFAULT} ${DEFAULT}  <|%{%}${ERROR} ${ERROR} ${ERROR}  <)%{%} %{%}"

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
alias alc="alc-cmd s"
alias be="bundle exec"
alias db:st="spring rake db:migrate:status"
alias db:up="spring rake db:migrate"
alias db:down="spring rake db:rollback"
alias dm='docker-machine'
alias dc='docker-compose'
alias g="git"
alias rk="bin/rake"
alias rs="bin/rspec"
alias pullreq='hub compare'
alias sch="ps ax | ag "
alias sp="bin/spring"
alias sprs="bin/spring rspec -fd"
alias sprk="bin/spring rake"
alias up='cd ../'
alias upp='cd ../../'


# function
function start_redis () {
    redis-server /usr/local/etc/redis.conf
}

function start_postgres () {
    postgres -D /usr/local/var/postgres
}

function plrb () {
    git pull --rebase origin `git rev-parse --abbrev-ref HEAD`
}

function refresh_zsh () {
    source $HOME/.zshrc
}
