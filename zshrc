# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sonicradish"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cupdate="c self-update && cu -vvv --profile"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn ruby symfony2 ssh-agent composer bower docker zsh-autosuggestions docker-compose gpg-agent)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export MICRO_HOME="~/Engine/Java/micro"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export GOROOT=/opt/go
export GOPATH=$HOME/.go
export COMPOSER_HOME="~/.composer"
export PATH=$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/greg/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.rvm/bin:/opt/jruby/bin:~/shoes4/bin:/opt/android/tools:/opt/android/platform-tools:$MICRO_HOME/bin:$GOROOT/bin:$GOPATH/bin:~/.npm-global/bin
export SISMO_DATA_PATH="~/.sismo/data"

alias -s avi=vlc
alias betty=$HOME/workspace/betty/main.rb

alias bk=buku
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PAGER=most
alias fuck-it='export THEFUCK_REQUIRE_CONFIRMATION=False; fuck; export THEFUCK_REQUIRE_CONFIRMATION=True'
alias cap=docker run --rm  -i -t -v $(pwd):/root/workdir  -v $(readlink -f $SSH_AUTH_SOCK):/root/ssh-agen mjanser/capifony
