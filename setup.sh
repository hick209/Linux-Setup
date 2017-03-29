#!/bin/sh

pwd=`pwd`

cd $(dirname "$0")
SETUP_FOLDER=`pwd -P`

cd $pwd
unset pwd


for file in `ls -A $SETUP_FOLDER/dotfiles`
do
    echo -n "Setting up $file... "
    if [ -f $HOME/$file -a ! -L $HOME/$file ]
    then
        # Make sure that existing files don't get overridden
		echo -n "Backing up $file to ${file}_old... "
        mv $HOME/$file $HOME/${file}_old
    fi
    # creates a link to the file
    ln -sf $SETUP_FOLDER/dotfiles/$file $HOME/$file
    echo "done!"
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
echo "Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo

echo -e "All done! Now PMF!!!\n"

