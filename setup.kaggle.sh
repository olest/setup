#!/usr/bin/env bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# installs typical tools needed for kaggle competitions

sudo apt-get -q -y update

sudo apt-get -q -y install g++
sudo apt-get -q -y install libgsl0-dev
sudo apt-get -q -y install libboost-dev

sudo apt-get -q -y install octave

# python essentials
sudo apt-get -q -y install python
sudo apt-get -q -y install python-scipy
sudo apt-get -q -y install python-numpy
wget https://pypi.python.org/packages/source/o/oct2py/oct2py-0.4.0.tar.gz
tar xzvf oct2py-0.4.0.tar.gz
cd oct2py-0.4.0.tar.gz


# R stuff
sudo apt-get -q -y install r-base-core
wget http://cran.r-project.org/src/contrib/randomForest_4.6-7.tar.gz
R CMD INSTALL randomForest_4.6-7.tar.gz

# cause effect data and git repo
#wget http://mlg.eng.cam.ac.uk/lloyd/temp/raw.tar.gz
if [ ! -d cause-effect ]; then
    git clone https://github.com/jamesrobertlloyd/cause-effect.git
fi

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

