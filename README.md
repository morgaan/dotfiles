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

Once vim open execute: `:PlugInstall`

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

## Install Neovim (nvim)

```
$ brew install neovim/neovim/neovim
```

The following alias is set into `.zshrc`
```
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
```
allows to map `vim` to be `nvim`

Run `:checkhealth` to figure out what are the missing providers.

Among the command to turn all OK are:

```
npm install -g neovim
brew install python@2
python2 -m pip install --user --upgrade pynvim
brew install python@3
python3 -m pip install --user --upgrade pynvim
gem install neovim
```

## Install ctags

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
