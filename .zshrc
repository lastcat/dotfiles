#######################################
# Color
#######################################
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#git関連の補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
autoload -Uz throw
autoload -Uz catch
compinit -u


setopt nonomatch
export PATH=/Users/yoshitake.nakaji/Downloads/android-ndk-r10d:$PATH
export PATH=/Users/yoshitake.nakaji/.nodebrew/node/v0.12.0/bin:/Users/yoshitake.nakaji/Downloads/android-ndk-r10d:/Users/yoshitake.nakaji/.nodebrew/current/bin:/Users/yoshitake.nakaji/Downloads/android-ndk-r10d:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/yoshitake.nakaji/Documents/gtest

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export CC=/usr/bin/gcc-3.s
#export BUNDLE_GEMFILE="Gemfile.local"
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/yoshitake.nakaji/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export GTEST_PATH=/Users/yoshitake.nakaji/Documents/gtest
setopt prompt_subst
autoload -Uz vcs_info
  zstyle ':vcs_info:*' actionformats \
      '%F{5}[%F{2}%b%F{7}:%F{6}%r%F{3}|%F{1}%a%F{5}]%f'
  zstyle ':vcs_info:*' formats \
      '%F{5}[%F{2}%b%F{7}:%F{6}%r%F{5}]%f'

  zstyle ':vcs_info:*' enable git

  vcs_info_wrapper() {
      vcs_info
      if [ -n "$vcs_info_msg_0_" ]; then
          echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
      fi
  }
  RPROMPT=$'$(vcs_info_wrapper)'
  function precmd {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
      export CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
    fi
  }
if [ -z "$PS1" ]; then return ; fi

if [ -z $TMUX ] ; then
        if [ -z `tmux ls` ] ; then
                tmux
        else
                tmux attach
        fi
fi
