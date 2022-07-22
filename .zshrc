autoload -U compinit; compinit

plugins=(git virtualenv)

setopt PROMPT_SUBST

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

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "[${VIRTUAL_ENV:t:gs/%/%%}]"
}

# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
export PROMPT=$'${vcs_info_msg_0_}%F{#6272a4}\U250C\U2500%f%F{#50fa7b} $(virtualenv_prompt_info)%f %(?.%F{#50fa7b}%?.%F{#ff5555}%?)%f %F{#ff79c6}%n@%m%f %F{#bd93f9}(%~)%f %F{#f1fa8c}$(git_info)%f \n%F{#6272a4}\U2514\U2500%f %F{#8be9fd}%#%f '

# dont require cd to change dir
setopt AUTO_CD

# auto correction
setopt CORRECT
setopt CORRECT_ALL

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm
export PNPM_HOME="/home/meizuflux/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# get vscode official extensions
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

# nnn commands
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'

# run nnn
alias n='nnn -daH'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# gpg key
export GPG_TTY=$(tty)
[ -f "/home/meizuflux/.ghcup/env" ] && source "/home/meizuflux/.ghcup/env" # ghcup-env