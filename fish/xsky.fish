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

xsky-dev
