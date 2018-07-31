#!/usr/bin/env fish
# aliases
function pushorigin
    git push origin --set-upstream (git br | grep '^*' | tr -d '* ')
end
