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
    sp = stash pop
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
