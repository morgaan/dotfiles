# dotfiles

## Prerequisite

- Copy this to ~/dotfiles
- Then run:


```
$ cd ~/dotfiles
$ chmod +x install.sh
$ cd ~
$ ./install.sh
$ git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git ~/dotfiles/iTerm2/iTerm2-Color-Schemes
```

You may need this:
```
$ mkdir ~/.vim-backupdir
$ mkdir ~/.vim-directory
```

## Install zsh

```
$ brew install zsh zsh-completions
```

Otherwise:
Check the [How to install zsh in many platforms](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#how-to-install-zsh-in-many-platforms)

## Install oh my zsh

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ rm ~/.zshrc
$ ln -s ~/dotfiles/.zshrc .zshrc
$ source ~/.zshrc
```

### Using z to jump to “recent” folders

```
$ brew install z
```

## Install nvm

```
$ brew install nvm
```

```
$ mkdir ~/.nvm
```

Install a node version you need on the current machine

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
2. In a shell, run tic ~/dotfiles/iTerm2Fix
3. Quit and restart iTerm2
4. Vim should now display italics properly

## Install ripgrep (required for CocSearch)

```
brew install ripgrep
```

## Install ctags (Optional now that we have CoC)

```
$ brew install ctags
```

## FZF

```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

Answer `n` to all prompt questions.

```
$ source ~/.zshrc
```

Run `fzf` command to check the installation worked.

## ack

```
$ brew install ack
```

## ag (the silver searcher)

```
$ brew install the_silver_searcher
```

## Bat

Used by vim fzf preview to render syntax highlighting

[bat](https://github.com/sharkdp/bat), A cat(1) clone with wings. `brew install bat`.

## Neovim

### Install Neovim (nvim)

```
$ brew install neovim
```

Run `:checkhealth` to figure out what are the missing providers.

Among the command to turn all OK are:

```
npm install -g neovim
brew install python@3
python3 -m pip install --user --upgrade pynvim
gem install neovim
```

### Install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## TMUX

### Install Vim plugins

Once vim open execute: `:PlugInstall`

## Tmux

### Install tmux

```
$ brew install tmux
```

### Remap caps lock to Ctrl if combined with key

In case of keyboard layout issue like this one:
https://github.com/pqrs-org/Karabiner-Elements/issues/1426#issuecomment-395700840
follow the instructions there.

Make sure that all keyboards in System Preferences have `Caps lock` key mapped
to `Caps lock` key.

Hopefully the install script manage to copy the `custom-capslock.json` file to
Karabiner config folder. If not cherry pick the commands from the `install.sh`
file.

In Karabiner go to `Complex Modification` and use the `Add rule` button. You
should see the `Change caps_lock to control if pressed...`. Enable it. Update
the value, in `Parameters` tab of `to_if_alone_timeout_milliseconds` to 500.

### Reattach to user namespace wrapper

Connects tmux to the OS X clipboard service. Useful for copy mode.

```
brew install reattach-to-user-namespace
```
