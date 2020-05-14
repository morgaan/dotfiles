cd ~
rm -rf .vim
rm -rf .config/coc/ultisnips
rm -rf .config/nvim
rm -f .vimrc
rm -f .ctags
rm -rf .tmux
rm -f .tmux.conf
rm -f .ackrc
rm -f .zshrc
rm -f .tern-project
rm -f .gitignore
rm -f .gitconfig
rm -f .git_template

ln -s ~/dotfiles/.vim .vim
mkdir -p .config/coc
ln -s ~/dotfiles/.config/coc/ultisnips .config/coc/ultisnips
mkdir -p .config/nvim
ln -s ~/dotfiles/.config/nvim/init.vim .config/nvim/init.vim
ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.ctags .ctags
ln -s ~/dotfiles/.tmux .tmux
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/.ackrc .ackrc
ln -s ~/dotfiles/.zshrc .zshrc
ln -s ~/dotfiles/.tern-project .tern-project
ln -s ~/dotfiles/.gitignore .gitignore
ln -s ~/dotfiles/.gitconfig .gitconfig
ln -s ~/dotfiles/.git_template .git_template
