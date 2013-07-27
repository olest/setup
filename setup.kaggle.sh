#!/usr/bin/env bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install g++

# python essentials
sudo apt-get install python
sudo apt-get install python-scipy
sudo apt-get install python-numpy

# R stuff
sudo apt-get install R
wget http://cran.r-project.org/src/contrib/randomForest_4.6-7.tar.gz
R CMD INSTALL randomForest_4.6-7.tar.gz

# cause effect data and git repo
#wget http://mlg.eng.cam.ac.uk/lloyd/temp/raw.tar.gz
git clone git@github.com:jamesrobertlloyd/cause-effect.git

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

