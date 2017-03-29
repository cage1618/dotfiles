# Recovery file permission
function recovery_files
    if test -n "$argv"
        echo "Must specify a dir"; and exit 3
    else
        set dir $argv
    end

    chmod -R 755 .
    find $dir -type f -exec chmod 644 {} \;
    find $dir -name "Thumbs.db" -exec rm {} \;
end
