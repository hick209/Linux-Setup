#!/bin/sh

SETUP_FOLDER=`pwd`

for file in `ls -A $SETUP_FOLDER/dotfiles`
do
    echo -n "Setting up $file..."
    if [ -f $HOME/$file ]
    then
        # Make sure that existing files don't get overridden
        mv $HOME/$file $HOME/${file}_old
    fi
    # creates a link to the file
    ln -sf $SETUP_FOLDER/dotfiles/$file $HOME/$file
    echo " done!"
done
echo


# Make sure we have the necessary tools
echo "Installing necessary tools..."
echo "Git"
sudo apt-get install -qy git-core
echo
echo "Vim"
sudo apt-get install -qy vim
echo


# Acquire pathogen.vim, which is a plugin manager for Vim
echo "Getting the Vim plugin manager, Pathogen..."
mkdir -p $HOME/.vim/autoload ~/.vim/bundle
curl -Sso $HOME/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
echo ""


# Get a Lint (syntax checker) for scripts in Vim
echo "Getting the Vim Lint checker..."
cd $HOME/.vim/bundle
if [ -d ./syntastic ]
then
    # just update
    cd syntastic
    git pull
else
    # create the repository
    git clone https://github.com/scrooloose/syntastic.git
fi
echo ""

cd $SETUP_FOLDER

echo "All done! Now PMF!!!\n"

