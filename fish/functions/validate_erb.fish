function validate_erb
    erb -P -x -T '-' $argv | ruby -c
end
