#!/bin/sh


if [ -x "$(command -v wget)" ]; then
    wget -q  https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/git_ps1 -O ->> ~/.bashrc
elif [ -x "$(command -o curl)" ]; then
    curl -s https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/git_ps1 >> ~/.bashrc
else
    echo 'Error: Please install wget or curl;'
    exit 1
fi

echo "Git PS1 has been uccessfully applied"