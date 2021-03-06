# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

HIST_STAMPS=yyyy-mm-dd

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PROMPT='%1~ %{$fg_bold[red]%}$(command git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}%{$fg[yellow]%} %# %{$reset_color%}'

############################################
# FASD - Command-line productivity booster #
############################################
#
# EXAMPLE BEHAVIORS
# ```
#   v def conf       =>     vim /some/awkward/path/to/type/default.conf
#   z abc            =>     cd /hell/of/a/awkward/path/to/get/to/abcdef
# ```

eval "$(fasd --init auto)"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias v='fasd -e vim'    # open the file with vim
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

_FASD_BACKENDS="native viminfo"

eval "$(hub alias -s)"
alias g='git'
alias gst='g status -sb'      # use short version of git status
alias gup='g pull --rebase'   # rebase by default
alias gap='g add -p'          # the best way to run git add
alias gd='g diff'             # show unstaged changes
alias gds='g diff --staged'   # show staged changes
alias gdh='g diff HEAD'       # show staged changes
alias gc='g commit -S --verbose' # use verbose mode with $EDITOR

alias 'ps?'='ps aux | grep'

alias nom='npm cache clear && rm -rf node_modules && npm install'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'


export EDITOR="/usr/local/bin/vim"
export BUNDLER_EDITOR="/usr/local/bin/vim"

alias e='emacsclient -t'
alias ec='emacsclient -c --no-wait'

eval "$(boot2docker shellinit 2>/dev/null)"

alias staging="APTIBLE_AUTH_ROOT_URL=https://auth.aptible-staging.com \
               APTIBLE_API_ROOT_URL=https://api.aptible-staging.com \
               APTIBLE_REMOTE=staging"

# added by travis gem
source /Users/rjackson/.travis/travis.sh

export NVM_DIR="/Users/rjackson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
