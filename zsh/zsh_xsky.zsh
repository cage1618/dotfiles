alias fetch-xsky='git fetch -p xsky; and git fetch --tags xsky'

function merge-xsky {
    set branch $(git rev-parse --abbrev-ref HEAD | egrep -v '^HEAD$'; or git rev-parse HEAD)
    git merge xsky/$branch
}

function del-br {
    git br -D $argv
    git push origin :$argv
}
