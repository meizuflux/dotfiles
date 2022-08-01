function fish_prompt
    function virtualenv
        if set -q VIRTUAL_ENV
            set_color 50fa7b; printf " [$(basename $VIRTUAL_ENV)]"
        end
    end

    function git_branch
        if test $(git rev-parse --show-toplevel 2> /dev/null)!=""
            set current_branch $(git branch --show-current)

            if test $(git status --porcelain)!=""
                set current_branch "$current_branch!"
            end

            printf " <$current_branch>"
        end
    end

    set_color 6272a4; printf "┌─"
    virtualenv
    set_color bd93f9; printf " $USER@$(prompt_hostname)"
    set_color ff79c6; printf " ($(prompt_pwd --full-length-dirs 4))"
    git_branch
    echo

    set_color 6272a4; printf "└─"
    set_color 8be9fd; echo -n " % " # printf does substitution with %

    set_color normal
end
