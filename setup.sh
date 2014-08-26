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


cd $SETUP_FOLDER

echo -e "All done! Now PMF!!!\n"

