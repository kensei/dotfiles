echo "bashrc"

# for linux
LS_COLORS='no=00:fi=00:di=01;38:ln=01;36:pi=40;33:so=01;36:do=01;36:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:';
export LS_COLORS
# for mac
LSCOLORS='GxFxCxDxBxegedabagaced'
export LSCOLORS
#export PS1="[\[\e[32;1m\]\W\[\e[0m\]]$"
if type __git_ps1 >/dev/null 2>&1; then
    :
else
    if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
        source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    fi
fi
export PS1='[\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;36m\]\W\[\033[00m\]$(__git_ps1 "(%s)")]$ '

case $(uname -s) in
    Darwin|FreeBSD)
        alias ls="ls -ahFG"
        alias ll="ls -alhFG"
    ;;
    Linux)
        alias ls='ls -F --color'
        alias la='ls -aF --color'
        alias ll='ls -alFh --color'
    ;;
    NetBSD|OpenBSD)
        alias ls="ls -ahF"
        alias ll="ls -alhF"
    ;;
esac

alias gr="grep -r -E -n --color=always --exclude='*.svn*' --exclude='*.log*' --exclude='*.tags'  --exclude='*tmp*' --exclude-dir='**/tmp' --exclude-dir='CVS' --exclude-dir='.svn' --exclude-dir='.git' . -e "
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ctags='ctags -R -f .tags'

# Java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias javadoc='javadoc -J-Dfile.encoding=UTF-8'
alias jar='jar -J-Dfile.encoding=UTF-8'

# share bash_history
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

function clear_docker_log() {
    local container_id="${1}"
    logfile=$(docker inspect $container_id --format "{{.LogPath}}")
    screen_name="docker_$(date +%s)"

    # LinuxKit にシリアル接続(detached screen として)
    screen -d -m -S ${screen_name} ~/Library/Containers/com.docker.docker/Data/vms/0/tty
    # ログを空にするコマンドを送信
    # 末尾の echo は Enter キー入力のエミュレート
    screen -S ${screen_name} -p 0 -X stuff $":> ${logfile}"$(echo -ne '\015')
    # シリアル接続を閉じる
    screen -S ${screen_name} -X quit
}

export DIRENV_PATH=$(brew --prefix)/bin/direnv
if [ -f "${DIRENV_PATH}" ]; then
    eval "$(direnv hook bash)"
fi
