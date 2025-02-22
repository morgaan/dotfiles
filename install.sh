cd ~
rm -rf .vim
rm -rf .config/nvim
rm -rf .tmux
rm -f .vimrc
rm -f .ctags
rm -rf .tmux
rm -f .tmux.conf
rm -f .wezterm.lua

rm -f .ackrc
rm -f .zshrc
rm -f .tern-project
rm -f .gitignore
rm -f .gitconfig
rm -f .git_template
rm -f copy-git-branch-to-clipboard.sh
rm -f git-clone-bare-for-worktrees.sh

ln -s ~/dotfiles/.config/nvim .config/nvim
ln -s ~/dotfiles/.tmux .tmux
ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.ctags .ctags
ln -s ~/dotfiles/.tmux .tmux
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/.wezterm.lua .wezterm.lua

ln -s ~/dotfiles/.ackrc .ackrc
ln -s ~/dotfiles/.zshrc .zshrc
ln -s ~/dotfiles/.tern-project .tern-project
ln -s ~/dotfiles/.gitignore .gitignore
ln -s ~/dotfiles/.gitconfig .gitconfig
ln -s ~/dotfiles/.git_template .git_template
ln -s ~/dotfiles/copy-git-branch-to-clipboard.sh copy-git-branch-to-clipboard.sh
ln -s ~/dotfiles/git-clone-bare-for-worktrees.sh git-clone-bare-for-worktrees.sh

