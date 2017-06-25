#!/usr/bin/env fish
# aliases
function md
    mkdir -p $argv
end

function pyfind
    find . -name "*.py" $argv
end

function pygrep
    grep --include="*.py" $argv
end

function pylint-quick
    pylint --reports=n --include-ids=y $argv
end

function .runsudo --description 'Run current command line as root'
    commandline -C 0
    commandline -i 'sudo '
    commandline -f execute
end

function pushorigin
    git push origin --set-upstream (git br | grep '^*' | tr -d '* ')
end
