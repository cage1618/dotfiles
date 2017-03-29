function copy
    if [ -f $argv[1] ]
        cat $argv[1] | pbcopy
    end
end
