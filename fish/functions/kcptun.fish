function kcptun
    if not tmux has-session -t 'kcptun' > /dev/null ^&1
        tmux new-session -s 'kcptun' -d "kcptun-client -r 'socks.liaoph.com:4096' -l ':2048' --mode fast2 --key redhat009 --crypt aes-128"
    end
end
