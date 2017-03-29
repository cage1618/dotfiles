# Instant web server
function web
    set dir .
    set port 8000
    set silent

    set n (count $argv)
    if math "$n > 0" > /dev/null
        set port $argv[1]
        if test -n $argv[2]
            set dir $argv[2]
        end
        for i in $argv
            if [ "$i" = '-s' ]
                set silent '-s'
            end
            if [ "$i" = '-d' ]
                set backend 'true'
            end
        end
    end

    if [ "$backend" = 'true' ]
        open "http://localhost:$port/"; and http-server $dir -p $port -s &
    else
        open "http://localhost:$port/"; and http-server $dir -p $port $silent
    end
end
