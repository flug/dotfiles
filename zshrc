# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sonicradish"

# ── Plugins ───────────────────────────────────────────────────────────────────
plugins=(git ssh-agent composer gpg-agent)

if [[ "$OSTYPE" == linux* ]]; then
    plugins+=(symfony2 docker docker-compose)
fi

source $ZSH/oh-my-zsh.sh

# ── Common exports ────────────────────────────────────────────────────────────
export GOPATH=$HOME/.go
export COMPOSER_HOME="$HOME/.composer"
export PAGER=most

# ── OS-specific config ────────────────────────────────────────────────────────
if [[ "$OSTYPE" == darwin* ]]; then

    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
    # GOROOT not needed if installed via homebrew or official pkg (go sets it automatically)

    # Homebrew (Apple Silicon: /opt/homebrew, Intel: /usr/local)
    if [[ -d /opt/homebrew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        export PATH="/usr/local/bin:$PATH"
    fi

    export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
    export PATH="$PATH:$GOPATH/bin"
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:$HOME/.rvm/bin"
    export PATH="$PATH:$HOME/.npm-global/bin"
    export PATH="$PATH:$HOME/.symfony/bin"

elif [[ "$OSTYPE" == linux* ]]; then

    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    export GOROOT=/opt/go
    export MICRO_HOME="$HOME/Engine/Java/micro"
    export SISMO_DATA_PATH="$HOME/.sismo/data"

    export PATH="$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
    export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
    export PATH="$PATH:/opt/jruby/bin:$HOME/shoes4/bin"
    export PATH="$PATH:/opt/android/tools:/opt/android/platform-tools"
    export PATH="$PATH:$MICRO_HOME/bin:$GOROOT/bin:$GOPATH/bin"
    export PATH="$PATH:$HOME/.rvm/bin"
    export PATH="$PATH:$HOME/.npm-global/bin"
    export PATH="$PATH:$HOME/.symfony/bin"
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:/opt/ngrok"

    # phpenv
    if command -v phpenv &>/dev/null || [[ -d "$HOME/.phpenv" ]]; then
        export PATH="$HOME/.phpenv/bin:$PATH"
        eval "$(phpenv init -)"
    fi

fi

# ── Common aliases ────────────────────────────────────────────────────────────
alias cupdate="c self-update && cu -vvv --profile"
alias bk=buku
alias betty=$HOME/workspace/betty/main.rb
alias -s avi=vlc
alias fuck-it='export THEFUCK_REQUIRE_CONFIRMATION=False; fuck; export THEFUCK_REQUIRE_CONFIRMATION=True'

# ── Linux-only aliases ────────────────────────────────────────────────────────
if [[ "$OSTYPE" == linux* ]]; then
    alias cap='docker run --rm -i -t -v $(pwd):/root/workdir -v $(readlink -f $SSH_AUTH_SOCK):/root/ssh-agen mjanser/capifony'
    alias phpqa='docker run --init -it --rm -p 34863:34863 -v "$(pwd):/project" -v "$(pwd)/tmp-phpqa:/tmp" -w /project jakzal/phpqa:php8.1-alpine'
fi

# ── Secrets (not versioned) ───────────────────────────────────────────────────
# Credentials are loaded from ~/.zshrc.secrets (gitignored)
[[ -f "$HOME/.zshrc.secrets" ]] && source "$HOME/.zshrc.secrets"

# ── Keybindings ───────────────────────────────────────────────────────────────
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line

# ── RVM (must be last) ────────────────────────────────────────────────────────
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
