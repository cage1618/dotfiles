# environment
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE="utf-8"

# virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=~/virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
[ -f /etc/bash_completion.d/virtualenvwrapper ] && source /etc/bash_completion.d/virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# homebrew
export HOMEBREW_GITHUB_API_TOKEN=a693b62fad1c3ddb0587c496c2731e3d48bab20b

# tmux
#export ZSH_TMUX_AUTOSTART=true
#export ZSH_TMUX_AUTOQUIT=true

# ansible
export ANSIBLE_CONFIG=$HOME/.ansible/
export ANSIBLE_INVENTORY=$HOME/.ansible/hosts

# autosuggestion
export AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

export PYENV_ROOT=/usr/local/var/pyenv
export GOPATH=/Users/Liao/Projects/go
export PATH=$PATH:$GOPATH/bin
