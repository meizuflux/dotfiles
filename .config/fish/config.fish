if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -z $DISPLAY; and test (tty) = "/dev/tty1"
    sway
end


#
#   ENV VARIABLES
#
# disable greeting
set -g fish_greeting
set -g PATH ~/.local/bin/ $PATH

#
#   ALIASES
#
alias n="nnn -daH"
alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
