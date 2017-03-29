# Path to Oh My Fish install.
set -gx OMF_PATH /Users/Liao/.local/share/omf
set -gx LSCOLORS Gxfxcxdxbxegedabagacad
set fish_greeting ""

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/Liao/.config/omf

# Custom env
source ~/.config/fish/env.fish

# Ustack function
[ -f ~/.config/fish/ustack.fish]; and source ~/.config/fish/ustack.fish

# Plugins
for dir in (ls ~/.config/fish/plugins/*.fish)
  source $dir
end

# Custom functions
source ~/.config/fish/functions/custom.fish

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Cowsay
# # python -c "import sys, random; stdout = sys.stdout; sys.stdout = type('BlackHole', (), {'write': (lambda self, string: '')})(); import this; sys.stdout = stdout; print random.choice(''.join([this.d.get(i, i) for i in this.s]).splitlines()[2:]);" | cowsay -f www | lolcat
fortune -n 160 50% computers 50% linuxcookie | cowsay -s -W 50 -f www | lolcat
