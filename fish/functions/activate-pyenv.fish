function activate-pyenv
    # pyenv virtualenv
    status --is-interactive; and . (pyenv init -|psub)
    status --is-interactive; and . (pyenv virtualenv-init -|psub)
end
