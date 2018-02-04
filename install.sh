cd ~
rm -rf .vim
rm -f .vimrc
rm -rf .tmux
rm -f .tmux.conf
rm -f .ackrc
rm -f .zshrc
rm -f .gitignore

ln -s ~/dotfiles/.vim .vim
ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.tmux .tmux
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/.ackrc .ackrc
ln -s ~/dotfiles/.gitignore .gitignore
