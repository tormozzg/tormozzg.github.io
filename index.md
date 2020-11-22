# Config

## Vim config

### Wget

```bash
wget -O - https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/vim_config.sh | bash
```

### Curl
```bash
bash <(curl -s https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/vim_config.sh)

```

### Raw 

Append into .vimrc 

```
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set wrap
set ai
set cin 
set showmatch
set hlsearch
set incsearch
set ignorecase
set number
syntax on
set background=light
set softtabstop=0 noexpandtab
```


## Git config

### Wget

```bash
wget -O - https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/git_config.sh | bash
```

### Curl
```bash
bash <(curl -s https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/git_config.sh)

```

### Raw

```
[alias]
    ls = log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate
    ll = log --pretty=format:%C(yellow)%h\\ %C(green)%ad\\ %Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --numstat --date=rfc2822
    lsg = log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --graph
    lsga = log --pretty=format:%C(yellow)%h%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --graph --all
    cp = cherry-pick
    st = status
    stl = status -s
    cl = clone
    ci = commit
    com = commit --all
    co = checkout
    br = branch
    di = diff
    dif = = diff --word-diff
    dc = diff --cached
    sl = stash list
    sa = stash apply
    ss = stash save
    lds = log --pretty=format:%C(yellow)%h\\ %C(green)%ad%Cred%d\\ %Creset%s%Cgreen\\ [%cn] --decorate --date=rfc2822
    sw = switch
    swc = switch -c
[color]
    ui = true
[core]
    autocrlf = input
    editor = vim 
    fileMode = false
    quotepath = false
```

## Git PS1

### Wget

```bash
wget -O - https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/git_ps1.sh | bash
```

### Curl
```bash
bash <(curl -s https://raw.githubusercontent.com/tormozzg/tormozzg.github.io/master/git_ps1.sh)

```

### Raw

Append into .bashrc 
```
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="verbose"

git_current_branch_name="\$(__git_ps1 '%s' | sed 's/ .\+//' | sed -e 's/[\\\\/&]/\\\\\\\\&/g')"
git_status_substitutes=(
    "s/$git_current_branch_name//;" # remove branch temporarily
    "s/u//;" # upstream
    "s/+\([0-9]\+\)/\e[1;36m▴\1\[\033[1;34m/;" # outgoing
    "s/-\([0-9]\+\)/\e[1;35m▾\1\[\033[1;34m/;" # incoming
    "s/%/\e[1;31m?\[\033[1;34m/;" # untracked
    "s/+/\e[1;32m✓\[\033[1;34m/;" # staged
    "s/*/\e[1;31m✕\[\033[1;34m/;" # unstaged
    "s/=//;"
    "s/\(.\+\)/\1/;" # insert branch again
)
git_status_command="\$(if [ \"$git_current_branch_name\" != '' ]; then echo \" \e[1;32m[$git_current_branch_name]\[\033[00m\]\$(__git_ps1 '%s'| sed \"${git_status_substitutes[@]}\")\"; fi; )"
PS1="\[\e[31m\][\t]\[\e[m\] \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$git_status_command\[\033[0;37m\]\$\[\033[0;00m\] "
unset git_status_substitutes git_status_command git_current_branch_namehs
```

# Mysql tips

## Musqldump

### Create dump

```bash 
read -s passwd ; mysqldump -udb_user -p$passwd db_name --single-transaction |pv -bat |gzip > dump.$(date +'%d.%m.%Y').sql.gz
```

### Restore dump

```bash
pv dump.sql.gz | zcat | mysql -udb_user -p db_name
```


# Git tips

## Diff of branches list

`git diff $(git branch --remotes | sed  -e s/[\s]*origin\\/// | sed -n '1!p' | git hash-object -w --stdin) $(git branch | git hash-object -w --stdin) --word-diff`
