# Install on new system

```
echo ".cfg" >> .gitignore
git clone https://github.com/meizuflux/dotfiles $HOME/.cfg

alias cfg='/usr/bin/git --git-dir $HOME/.cfg --work-tree=$HOME'
cfg config --local status.showUntrackedFiles no

cfg checkout
```

# Add files

```
cfg add README.md

cfg commit -m "Add README"

cfg push -u origin master
```
