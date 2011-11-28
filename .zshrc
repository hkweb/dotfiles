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

# ls�����Ȥ��Υǥ��쥯�ȥ�ο����Ѥ���
#export LSCOLORS=Exfxcxdxbxegedabagacad


# PROMPT
PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) " # �����դϹ���
RPROMPT="%T" # ��¦�˻��֤�ɽ������
setopt transient_rprompt # ��¦�ޤ����Ϥ���������֤�ä�
setopt prompt_subst # �����ʥץ���
bindkey -e # emacs�饤���ʥ����Х����

export EDITOR=vim # ���ǥ�����emacs


autoload -U compinit # ���Ϥ��䴰��ǽ
compinit -u # ���Τ������Ȥ�ʤ���zsh�ȤäƤ��̣�ʤ�
setopt autopushd # cd�������ɽ��
setopt pushd_ignore_dups # Ʊ�ǥ��쥯�ȥ��������ɲä��ʤ�
setopt auto_cd # ��ưŪ�˥ǥ��쥯�ȥ��ư
setopt list_packed # �ꥹ�Ȥ�ͤ��ɽ��
setopt list_types # �䴰�����ե��������ɽ��


# ����
HISTFILE=~/.zsh_history # history�ե�����
HISTSIZE=10000 # �ե����륵����
SAVEHIST=10000 # save������
setopt hist_ignore_dups # ��ʣ��Ͽ���ʤ�
setopt hist_reduce_blanks # ���ڡ����ӽ�
#setopt share_history # ����ե������ͭ
setopt EXTENDED_HISTORY # zsh�γ��Ͻ�λ��Ͽ


# history ���ޤ��
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
#[ -f ~/.zshrc.include ] && source ~/.zshrc.include # ����ե������include
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

