#! /usr/bin/env bash
cp ./vimrc ~/.vimrc
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

# copy files
for i in `ls`; do
    cp -R ./$i ~/.vim/
done

# clean up
for f in deploy.sh README.md vimrc; do
    rm ~/.vim/$f
done
