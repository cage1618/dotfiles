#!/usr/bin/env fish
# aliases
function l
  ls -lah $argv
end

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

function h
  history
end

# Instant web server
function web
  if test -n "$argv"
    set port $argv
  else
    set port 8001
  end

  open "http://localhost:$port/"; and python -m SimpleHTTPServer "$port"
end

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


