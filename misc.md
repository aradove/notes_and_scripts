### Git branch and CC view for prompt
```
  setenv IS_GIT_REPO `git rev-parse --git-dir >& /dev/null; echo $?`   
  setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | grep '^*' | sed -r -e 's/[()]//g' -e 's/^\*\s*(.*)/\1/'"  
```
### History search - Key binding
```
bindkey "\e[A" history-search-backward  
bindkey "\e[B" history-search-forward
```  

### default editor
```
  setenv EDITOR nedit
```
### Alias for the webpage cheat
```
  alias cheat curl cht.sh/\!$
```

### .netrc
```
  machine "address" login "userid" password "password"
```

### .vimrc
```
  set lines=50 columns=110  
  set nocp  
  set magic  
  syn on  
  set number  
  set hlsearch  
  set nocindent  
  set smartindent  
  set backspace=2  
  set expandtab sw=4 ts=4  
  set laststatus=2  
  set ruler  
  map <S-Insert> "*p  
  set guifont=Monospace\ 10  
  noremap % %v  
  vnoremap // y/<C-R>"<CR>  
  ##### this needs pathogen  
  execute pathogen#infect()  
```

### Check ip configuration
```
  ifconfig
```

### hexdump
```
  hexdump -C /file/path -n "number of byte to check"
```
### active processes
```
  ps -aux | grep "process you want to find. "
```
### WINDOWS Onedrive make a link and backup
```
# https://www.tenforums.com/tutorials/92892-sync-any-folder-onedrive-windows-10-a.html  
  mklink /j "%UserProfile%\OneDriv\backup\sublime-settings" "C:\Users\USERNAME\AppData\Roaming\Sublime Text 3\Packages\User"
```
### Custom color sublime  
```
# https://github.com/kujiy/how-to-change-sublime-minimap-color     
# https://gist.github.com/bwonur/c4b5dd363386dcfaf4489125eaab875b  
```

### Sublime + CTAGS
https://chromium.googlesource.com/chromium/src/+/master/docs/sublime_ide.md#Alternative_Code-Completion-with-Ctags

Download and add Exuberant Ctags to PATH. http://ctags.sourceforge.net/
Install Sublime CTags plugin.

### rebase with conflict
Simplest is to use meld, install it.

Make sure the changes are in the remote repository.   
```
git reset --hard 'previous-commit-id'
git fetch
git rebase origin/master
git cherrypick 'my-new-commit-id'
```
Solve the conflict.   
Push and you are done. 




