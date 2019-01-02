# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
  export PATH=$HOME/bin:/usr/local/vim80/bin:$PATH
# Path to your oh-my-zsh installation.
  export ZSH=/home/lixiaoxing/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export GREP_OPTIONS="--exclude-dir=\.svn --exclude-dir=\.git  --exclude=tags --exclude=*\.prj"
export SVN_EDITOR=vim
export TERM=xterm-256color

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#针对文件类型的 alias, 以下类型文件将用vim打开
alias -s php=vim
alias -s js=vim
alias -s json=vim
alias -s html=vim
#svn 
alias si="svn info"
alias st='svn st'
alias slg='svlog() { svn log -v -l "$1"}; svlog'
alias slgd='svn_log date'
alias slgu='svn_log date2'
alias slgr='svn_log revision'
alias sd='svn_diff'
alias sci='svnci'
alias py3="/usr/local/python3.6/bin/python3.6"
alias tp="~/bin/tr.py"

alias pub="publish"
alias pug="publish_git"

alias tmux="tmux -2"
alias f='call_fg() { fg %"$1" }; call_fg'
alias phpunit="/data1/lixiaoxing/repo/phpunit.phar"
alias gmy="git log --oneline --author=lixiaoxing --name-only";
alias pj='proj'
alias pa='proja'
alias pp='projp'
#alias translate="translate"
#Specific functions and alias by lixiaoxing@nicaifu.com
function svn_diff(){
    echo "svn diff $*"
    svn diff $*
    return 
}

function proj(){
    cd ~/devspace/face
    vim www/www/index.php
}
function projp(){
    cd ~/labs/platform-server
    vim index.php
}
function proja(){
    cd ~/devspace/ace
    vim finance/www/index.php
}
function svnci(){
    if [ "$#" -gt 0 ]; then
        msg=$1
    else 
        msg="up"
    fi

    list=$(svn st |awk '$1=="M" {print $2}'|grep -v 'www/index'|grep -v 'development/'|grep -v 'production/' | grep -v 'rollback.cmd'| grep -v 'index*' | grep -v "conf/*" |grep -v 'cli')
    if [ -z $list ]; then
        echo 'file list is empty!'
        return 0
    else
        echo $list
    fi

    read "input?确认提交文件(y/n):"
    if [ $input != "y" ]
    then
        echo "you canceled!"
        return 0
    fi
    list=$(echo $list | tr -t "\n" " "|sed 's/[ \t]*$//g' )

    echo "svn ci $list -m $msg"
    echo $list | xargs svn ci -m $msg

    echo "publish test $list"
    publish test $list
    
}

function svn_log(){
    if [ $1 = 'date' ]; then
        svnday=$2;
        if [ ${#svnday} -eq 3 ]; then
            svnday=0${svnday};
        fi
        if [ -n "$3" ]; then
            author=$3
        else
            author='lixiaoxing'
        fi
        svn log -v -rhead:{2018${svnday}} | sed -n '/'${author}'/,/-----$/ p';
    elif [ $1 = 'revision' ]; then
        svn log -v -rhead:"$2" | sed -n '/lixiaoxing/,/-----$/ p';

    elif [ $1 = 'date2' ]; then
        svnday=$2;
        if [ ${#svnday} -eq 3 ]; then
            svnday=0${svnday};
        fi
        if [ -n "$3" ]; then
            author=$3
        else
            author='lixiaoxing'
        fi
        svn log -v -rhead:{2018${svnday}} | sed -n '/'${author}'/,/-----$/ p' | grep trunk|awk -F"trunk/" '{print $2}' | sort -u;
    fi
        
}

function __translate()
{
  wd="`echo -n $1 | sed 's/ /%20/g'`"
  if [ "$wd" = "" ];then
    return 0
  fi
  tmp=/tmp/.fanyi.tmp
  touch $tmp
  curl --connect-timeout 4 -s -L http://dict.youdao.com/search\?q\=$wd -o $tmp
  [ $? -ne 0 ] && rm -rf $tmp return 1
  fy=`grep -E -A30  '<span class="pronounce">' $tmp`
  vo=`sed -n 's#^.*<span class="phonetic">\(.*\)</span>.*#\1#gp' $tmp`
  if [ "$vo" != "" ];then
    echo $vo
  fi
  echo $fy | grep -E -o "<li>.*</li>" | sed -n 's#<ul>\|<li>\|</ul>\|</li>##gp'
  rm -rf $tmp
}


function svn_others(){
    if [ $1 = 'author' ]; then
        svnday=$2;
        if [ ${#svnday} -eq 3 ]; then
            svnday=0${svnday};
        fi
        svn log -v -rhead:{2018${svnday}} | sed -n '/lixiaoxing/,/-----$/ p';
    elif [ $1 = 'revision' ]; then
        svn log -v -rhead:"$2" | sed -n '/lixiaoxing/,/-----$/ p';

    fi
        
}
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
