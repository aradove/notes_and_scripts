### Git branch and CC view for prompt
```
  setenv IS_GIT_REPO `git rev-parse --git-dir >& /dev/null; echo $?`   
  setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | grep '^*' | sed -r -e 's/[()]//g' -e 's/^\*\s*(.*)/\1/'"  
```

### custom line for ubuntu

First download a font of choice
https://www.nerdfonts.com/font-downloads

get config to put in .bashrc
https://gist.github.com/justintv/168835

```
# prompt
FMT_BOLD="\[\e[1m\]"
FMT_DIM="\[\e[2m\]"
FMT_RESET="\[\e[0m\]"
FMT_UNBOLD="\[\e[22m\]"
FMT_UNDIM="\[\e[22m\]"
FG_BLACK="\[\e[30m\]"
FG_BLUE="\[\e[34m\]"
FG_CYAN="\[\e[36m\]"
FG_GREEN="\[\e[32m\]"
FG_GREY="\[\e[37m\]"
FG_MAGENTA="\[\e[35m\]"
FG_RED="\[\e[31m\]"
FG_WHITE="\[\e[97m\]"
BG_BLACK="\[\e[40m\]"
BG_BLUE="\[\e[44m\]"
BG_CYAN="\[\e[46m\]"
BG_GREEN="\[\e[42m\]"
BG_MAGENTA="\[\e[45m\]"

PS1="\n ${FG_BLUE}╭─" # begin arrow to prompt
PS1+="${FG_MAGENTA}" # begin USERNAME container
PS1+="${BG_MAGENTA}${FG_CYAN}${FMT_BOLD}  " # print OS icon
PS1+="${FG_WHITE}\u" # print username
PS1+="${FMT_UNBOLD} ${FG_MAGENTA}${BG_BLUE} " # end USERNAME container / begin DIRECTORY container
PS1+="${FG_GREY}\w " # print directory
PS1+="${FG_BLUE}${BG_CYAN} " # end DIRECTORY container / begin FILES container
PS1+="${FG_BLACK}"
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) " # print number of folders
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) " # print number of files
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) " # print number of symlinks
PS1+="${FMT_RESET}${FG_CYAN}"
PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"" # check if git branch exists
PS1+="${BG_GREEN} " # end FILES container / begin BRANCH container
PS1+="${FG_BLACK} BRANCH " # print current git branch
PS1+="${FMT_RESET}${FG_GREEN}\")\n " # end last container (either FILES or BRANCH)
PS1+="${FG_BLUE}╰ " # end arrow to prompt
PS1+="${FG_CYAN}\\$ " # print prompt
PS1+="${FMT_RESET}"
export PS1
```

### Set terminal name to folder name
PS1=$PS1'\[\e]2;\W\a\]'


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

### Outlook manage profiles
```
outlook.exe /manageprofiles
```
### Outlook solve random licence issues
```
cd C:\Program Files (x86)\Microsoft Office\Office16
cscript ospp.vbs /dstatus    
cscript ospp.vbs /act
```


