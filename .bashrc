echo "bashrc"

LS_COLORS='no=00:fi=00:di=01;35:ln=01;36:pi=40;33:so=01;36:do=01;36:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:';
export LS_COLORS
export PS1="[\[\e[32;1m\]\W\[\e[0m\]]$"
export PS1='[\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;36m\]\W\[\033[00m\]]\$ '

alias ls='ls -aFh --color'
alias lsl='ls -alFh --color'
alias gr="grep -r -E -n --color=always --exclude='*.svn*' --exclude='*.log*' --exclude='*tmp*' --exclude-dir='**/tmp' --exclude-dir='CVS' --exclude-dir='.svn' --exclude-dir='.git' . -e "
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ctagsp='ctags -R --languages=PHP --langmap=PHP:.php.inc --php-types=c+f+d -f .tags'

# Java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias javadoc='javadoc -J-Dfile.encoding=UTF-8'
alias jar='jar -J-Dfile.encoding=UTF-8'
