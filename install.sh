cd ~
rm -rf .vim
rm -f .vimrc
rm -rf .config
rm -rf .config/nvim
rm -rf .config/coc/ultisnips
rm -f .ctags
rm -rf .tmux
rm -f .tmux.conf
rm -f .ackrc
rm -f .zshrc
rm -f .tern-project
rm -f .gitignore
rm -f .gitconfig
rm -f .ackrc

ln -s ~/dotfiles/.vim .vim
ln -s ~/dotfiles/.config/coc/ultisnips .config/coc/ultisnips
ln -s ~/dotfiles/.config/nvim .config/nvim
ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.ctags .ctags
ln -s ~/dotfiles/.tmux .tmux
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/.ackrc .ackrc
ln -s ~/dotfiles/.zshrc .zshrc
ln -s ~/dotfiles/.tern-project .tern-project
ln -s ~/dotfiles/.gitignore .gitignore
ln -s ~/dotfiles/.gitconfig .gitconfig
ln -s ~/dotfiles/.ackrc .ackrc
ln -s ~/dotfiles/.git_template .git_template
