export EDITOR=vi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
	alias cd='pushd'
	alias p='popd'
fi


PATH=$PATH:/opt/appengine-java-sdk-1.3.4/bin/:/home/hata/bin

# lsしたときのディレクトリの色を変える
#export LSCOLORS=Exfxcxdxbxegedabagacad


# PROMPT
PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) " # この辺は好み
RPROMPT="%T" # 右側に時間を表示する
setopt transient_rprompt # 右側まで入力がきたら時間を消す
setopt prompt_subst # 便利なプロント
bindkey -e # emacsライクなキーバインド

export EDITOR=vim # エディタはemacs


autoload -U compinit # 強力な補完機能
compinit -u # このあたりを使わないとzsh使ってる意味なし
setopt autopushd # cdの履歴を表示
setopt pushd_ignore_dups # 同ディレクトリを履歴に追加しない
setopt auto_cd # 自動的にディレクトリ移動
setopt list_packed # リストを詰めて表示
setopt list_types # 補完一覧ファイル種別表示


# 履歴
HISTFILE=~/.zsh_history # historyファイル
HISTSIZE=10000 # ファイルサイズ
SAVEHIST=10000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
#setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録


# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#
## alias
#alias ls="ls -G --color=auto"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#
#
#[ -f ~/.zshrc.include ] && source ~/.zshrc.include # 設定ファイルのinclude
#

#if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi

#PATH=$HOME/.rvm/bin:$PATH

#rvm ruby-1.9.2-head
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi


alias r=rails
alias vi=vim

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hata/.zshrc'

autoload -Uz compinit
compinit

bindkey "^W" vi-backward-kill-word

# move cursor each word
bindkey ";5C" forward-word
bindkey ";5D" backward-word

#cd ~/projects/jimocities

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

