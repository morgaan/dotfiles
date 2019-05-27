# dotfiles


- Copy this to ~/dotfiles
- Then run:


```
$ cd ~/dotfiles
$ chmod +x install.sh
$ ./install.sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
$ git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git ~/dotfiles/iTerm2/iTerm2-Color-Schemes
$ cd ~/dotfiles/.vim/bundle/tern_for_vim
$ npm install
```

You may need this:
```
$ mkdir ~/.vim-backupdir
$ mkdir ~/.vim-directory
```

Once vim open execute: `:PluginInstall`

For zsh + oh my zsh + iterm2

## Install zsh

```
$ brew install zsh
```

## Install oh my zsh

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)”
```

source ~/.zshrc (if it doesn't source approprietly, delete the file ~/.zshrc and re-execute the linking ln -s ~/dotfiles/.zshrc .zshrc and then source again)

### Using z to jump to “frecent” folders

```
$ brew install z
```

## Iterm2

https://iterm2.com/downloads.html

Once iterm is opened, go to Preferences > General > Preferences and check Load preferences... and set folder to ~/dotfiles/iTerm2.

To install Powerline fonts

```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

In iTerm2 access the Preferences pane on the Profiles tab.
Under the Text tab change the font for each type (Regular and Non-ASCII) to ‘Inconsolata for Powerline’. (Refer to the powerline-fonts repo for help on font installation.)

### Comments are highlighted in vanilla vim

This is happening because you have italics enabled, but some combination of your iTerm2 reported terminal type and terminfo database is causing italics to be displayed incorrectly.

1. In iTerm2 preferences, on the “Terminal” tab, for the “Report Terminal Type:” setting, select “xtern-256color” if it’s not already selected
2. Create a file somewhere on disk with the following contents:

        xterm-256color|xterm with 256 colors and italic,
          sitm=\E[3m, ritm=\E[23m,
          use=xterm-256color,
3. In a shell, run tic path/to/the/file/you/just/made
4. Quit and restart iTerm2
5. Vim should now display italics properly

## Bat

[bat](https://github.com/sharkdp/bat), A cat(1) clone with wings. (brew install bat). Used by vim fzf preview to render syntax highlighting
