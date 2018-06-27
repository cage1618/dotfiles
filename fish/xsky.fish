function xsky-dev
    if not echo $GOPATH | grep XSky > /dev/null
        set -gx GOPATH $GOPATH:/Users/Liao/Projects/XSky/go
    end
end

function demontest
    docker start demon-test-db > /dev/null ^ /dev/null
    go test -v $argv -args (pwd)/tests/conf/app.conf
    docker stop demon-test-db > /dev/null ^ /dev/null
end

function fetch-xsky
    git fetch -p xsky; and git fetch --tags xsky
end

function merge-xsky
    set branch (git rev-parse --abbrev-ref HEAD | egrep -v '^HEAD$'; or git rev-parse HEAD)
    git merge xsky/$branch
end

function del-br
    git br -D $argv
    git push origin :$argv
end

#xsky-dev
