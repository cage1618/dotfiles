# Docs
function doc
    function help_exit
        echo "Usage: doc [DOCUMENT]"
        echo ""
        echo "Available Documents:"
        echo "    1)  Ansible"
        return 1
    end

    function show_webs
        for i in (seq 1 15; seq 20 35)
            set -l port (math "8000+$i")
            if lsof -nP -i :{$port} > /dev/null ^&1
                echo "$i is in opened."
            end
        end
    end

    function stop_web
        if [ $argv[1] = 8 ]
            docker stop docker-docs
        else
            set -l port (math "8000+$argv")
            lsof -nP -i :{$port} | awk 'NR!=1 {print $2}' | xargs kill -9
        end
    end

    if test -z "$argv"
        help_exit
    else
        switch $argv[1]
            case status
                show_webs
            case stop
                stop_web $argv[2]
            case 1
                web 8002 /Users/Liao/Documents/Doc-sites/Ansible -d
            case '*'
                echo 'Invalid Ducument Number'
                help_exit
        end
    end
end
