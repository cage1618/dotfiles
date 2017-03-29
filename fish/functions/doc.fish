# Docs
function doc
    function help_exit
        echo "Usage: doc [DOCUMENT]"
        echo ""
        echo "Available Documents:"
        echo "    1)  Puppet"
        echo "    2)  Ansible"
        echo "    3)  SaltStack"
        echo "    4)  Python"
        echo "    5)  Ruby"
        echo "    6)  Galera"
        echo "    7)  HAProxy"
        echo "    8)  Docker"
        echo "    9)  Django"
        echo "    10) Python-guide"
        echo "======== OpenStack Documentation ========="
        echo "    20) Fuel Documentation"
        echo "    21) Installation Guide for RDO"
        echo "    22) API Complete Reference"
        echo "    23) API Guide"
        echo "    24) Configuration Reference"
        echo "    25) Administrator Guide"
        echo "    26) High Availability Guide"
        echo "    27) Operations Guide"
        echo "    28) Security Guide"
        echo "    29) Virtual Machine Image Guide"
        echo "    30) Architecture Design Guide"
        echo "    31) Networking Guide"
        echo "    32) End User Guide"
        echo "    33) Command-Line Interface Reference"
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
                web 8001 /Users/Liao/Documents/Doc-sites/Puppet/ -d
            case 2
                web 8002 /Users/Liao/Documents/Doc-sites/Ansible -d
            case 3
                web 8003 /Users/Liao/Documents/Doc-sites/SaltStack -d
            case 4
                web 8004 /Users/Liao/Documents/Doc-sites/Python -d
            case 5
                web 8005 /Users/Liao/Documents/Doc-sites/Ruby -d
            case 6
                web 8006 /Users/Liao/Documents/Doc-sites/Galera -d
            case 7
                web 8007 /Users/Liao/Documents/Doc-sites/HAProxy -d
            case 8
                set running (docker inspect --format="{{ .State.Running }}" docker-docs)
                if [ $running = false ]
                    docker start docker-docs
                end
                open http://localhost:8008
            case 9
                web 8009 /Users/Liao/Documents/Doc-sites/Django -d
            case 10
                web 8010 /Users/Liao/Documents/Doc-sites/Python/python-guide -d
            case 20
                web 8020 /Users/Liao/Documents/Doc-sites/Fuel -d
            case 21
                web 8021 /Users/Liao/Documents/Doc-sites/OpenStack/install-guide-rdo -d
            case 22
                web 8022 /Users/Liao/Documents/Doc-sites/OpenStack/api-ref -d
            case 23
                web 8023 /Users/Liao/Documents/Doc-sites/OpenStack/api-guide -d
            case 24
                web 8024 /Users/Liao/Documents/Doc-sites/OpenStack/config-reference -d
            case 25
                web 8025 /Users/Liao/Documents/Doc-sites/OpenStack/admin-guide -d
            case 26
                web 8026 /Users/Liao/Documents/Doc-sites/OpenStack/ha-guide -d
            case 27
                web 8027 /Users/Liao/Documents/Doc-sites/OpenStack/ops-guide -d
            case 28
                web 8028 /Users/Liao/Documents/Doc-sites/OpenStack/security-guide -d
            case 29
                web 8029 /Users/Liao/Documents/Doc-sites/OpenStack/image-guide -d
            case 30
                web 8030 /Users/Liao/Documents/Doc-sites/OpenStack/arch-design -d
            case 31
                web 8031 /Users/Liao/Documents/Doc-sites/OpenStack/networking-guide -d
            case 32
                web 8032 /Users/Liao/Documents/Doc-sites/OpenStack/user-guide -d
            case 33
                web 8034 /Users/Liao/Documents/Doc-sites/OpenStack/cli-reference -d
            case '*'
                echo 'Invalid Ducument Number'
                help_exit
        end
    end
end
