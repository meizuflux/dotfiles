export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

autoload -U compinit; compinit

plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

git_info() {
    project_root=$(git rev-parse --show-toplevel 2> /dev/null)
  
    if [[ -z $project_root ]]; then
        return
    fi

    current_branch=$(git branch --show-current)

    if [ -z "$(git status --porcelain)" ]; then 
    else 
        current_branch="$current_branch!"
    fi


    printf "<$current_branch>"
    return
}


export PS1=$'\n%F{#6272a4}\U250C\U2500%{$reset_color%}%F{#50fa7b}$(virtualenv_prompt_info)%{$reset_color%} %F{#ff79c6}%n@%m%{$reset_color%} %F{#bd93f9}(${PWD/#$HOME/\~})%{$reset_color%} %F{#f1fa8c}$(git_info)%{$reset_color%} \n%F{#6272a4}\U2514\U2500%{$reset_color%} %F{#8be9fd}$%{$reset_color%} '






# custom stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# pnpm
export PNPM_HOME="/home/meizuflux/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# custom from here on out

# get vscode official extensions
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

# nnn commands
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'

# run nnn as sudo
alias n='nnn -daH'
alias dotgit='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# gpg key
export GPG_TTY=$(tty)