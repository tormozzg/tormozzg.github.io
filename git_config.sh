#!/bin/sh

if ! [ -x "$(command -v git)" ]; then
    echo "Git not installed"
    exit 1
fi

git config --global alias.ls  "log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate"
git config --global alias.ll  "log --pretty=format:%C(yellow)%h\\ %C(green)%ad\\ %Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --numstat --date=rfc2822"
git config --global alias.lsg "log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --graph"
git config --global alias.lsga "log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --graph --all"
git config --global alias.cp  "cherry-pick"
git config --global alias.st  "status"
git config --global alias.stl "status -s"
git config --global alias.cl  "clone"
git config --global alias.ci  "commit"
git config --global alias.com "commit --all"
git config --global alias.co  "checkout"
git config --global alias.br  "branch"
git config --global alias.br  "branch"
git config --global alias.di  "diff"
git config --global alias.dif "= diff --word-diff"
git config --global alias.dc  "diff --cached"
git config --global alias.sl  "stash list"
git config --global alias.sa  "stash apply"
git config --global alias.sp  "stash pop"
git config --global alias.ss  "stash save"
git config --global alias.lds "log --pretty=format:%C(yellow)%h\\ %C(green)%ad%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --date=rfc2822"
git config --global alias.sw "switch"
git config --global alias.swc "switch -c"
git config --global color.ui true
git config --global core.autocrlf input
git config --global core.editor vim
git config --global core.fileMode false
git config --global core.quotepath false
git config --global push.default current

echo "Git config has been successfully applied"
