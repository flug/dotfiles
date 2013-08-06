export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
plugins=(git svn extract symfony symfony2 ssh-agent composer bower)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/users/gparis/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/users/gparis/.local/bin
real_git=$(which git)
function git {
    if [[ ($1 == svn) && ($2 == dcommit) ]]
    then
        curr_branch=$($real_git branch | sed -n 's/\* //p')
        if [[ ($curr_branch != master) && ($curr_branch != '(no branch)') && ($curr_branch != local_*) && ($curr_branch != 1*) ]]
        then
            echo "Committing from $curr_branch; are you sure? [y/N]"
            read resp
            if [[ ($resp != y) && ($resp != Y) ]]
            then
                return 2
            fi
        fi
    fi
    $real_git "$@"
}
function gitstatus()
{
  git status
  if [[ -d src ]]
  then
    source_dir=src
  else
    source_dir=plugins
  fi
  for repo in $source_dir/**/.git
  do
    wt=${repo:0:${#repo}-4}
    OUTPUT=`git --git-dir=$repo --work-tree=$wt status`
    LENGTH=`echo "$OUTPUT"|wc -l`
    if [[ $LENGTH -gt 2 ]]
    then
      echo $wt ":"
      echo $OUTPUT
    fi
  done
}
function gitcommit()
{
  git svn dcommit
  if [[ -d src ]]
  then
    source_dir=src
  else
    source_dir=plugins
  fi
  for repo in $source_dir/**/.git
  do
    cd $repo/..
    git svn dcommit
    cd -
  done
}
function gitup
{
  git svn rebase
  if [[ -d src ]]
  then
    source_dir=src
  else
    source_dir=plugins
  fi
  for repo in $source_dir/**/.git
  do
    cd $repo/..
    OUTPUT=`git svn rebase`
    LENGTH=`echo "$OUTPUT"|wc -l`
    if [[ $LENGTH -gt 2 ]]
    then
      echo $repo ":"
      echo $OUTPUT
    fi
    cd -
  done
}
function gitbranch()
{
  git branch
  if [[ -d src ]]
  then
    source_dir=src
  else
    source_dir=plugins
  fi
  for repo in $source_dir/**/.git
  do
    cd $repo/..
    OUTPUT=`git branch`
    LENGTH=`echo "$OUTPUT"|wc -l`
    if [[ $LENGTH -gt 1 ]]
    then
      echo $repo ":"
      echo $OUTPUT
    fi
    cd -
  done
}
alias ack=ack-grep
export PAGER=most
export EDITOR=vi

bindkey -e
bindkey "5C" forward-word
bindkey "5D" backward-word
source ~/dev/switch/switch.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PAGER=most
