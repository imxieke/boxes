###
 # @Author: Cloudflying
 # @Date: 2021-09-19 01:49:42
 # @LastEditTime: 2024-05-08 21:44:23
 # @LastEditors: Cloudflying
 # @Description: zsh config file
###

# init PATH
# 前面优先级高 覆盖系统自带的命令
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
# export MANPATH=''

# Set locale and language
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# export NVM_NODEJS_ORG_MIRROR=http://mirrors.ustc.edu.cn/node
# export NVM_NODEJS_ORG_MIRROR=https://registry.npmmirror.com/-/binary/node
export NVM_NODEJS_ORG_MIRROR=https://cdn.npmmirror.com/binaries/node
export NPM_CONFIG_REGISTRY=https://registry.npmmirror.com
export NVM_DIR="${HOME}/.local/share/nvm"

export BOXS_HOME=${HOME}/.boxs
export BOXS_CONF=${BOXS_HOME}/conf
export BOXS_LOGS=${BOXS_HOME}/logs

# Check zsh load time for debug
zmodload zsh/zprof

# 加载本地自定义变量
[[ -f "${HOME}/.env" ]] && source "${HOME}/.env"

# Proxy
# 配置代理
if [[ -n "${MIXED_PROXY}" ]]; then
	export http_proxy=http://${MIXED_PROXY}
	export https_proxy=http://${MIXED_PROXY}
	export rsync_proxy=http://${MIXED_PROXY}
	export ftp_proxy=http://${MIXED_PROXY}
	export all_proxy=http://${MIXED_PROXY}
	export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh" ]]; then
  source ${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh
fi

export ZSH=$HOME/.oh-my-zsh
# If you come from bash you might have to change your $PATH.

[ ! -d ~/.local/share/zinit ] && git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit

if [[ -f ~/.local/share/zinit/zinit.zsh ]]; then
    source ~/.local/share/zinit/zinit.zsh
	autoload -Uz _zinit
	(( ${+_comps} )) && _comps[zinit]=_zinit
	# setopt promptsubst
	# ZSH_THEME='strug'
	zinit load zdharma-continuum/fast-syntax-highlighting
	# zinit load zsh-users/zsh-syntax-highlighting
	# 灰色显示历史运行的命令
	zinit load zsh-users/zsh-autosuggestions
	zinit load zsh-users/zsh-history-substring-search
	# 会阻止 zsh 默认的上下选择历史命令记录
	# 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.
	zinit load marlonrichert/zsh-autocomplete
	# Additional completion definitions for Zsh.
	# _cmd file
	zinit load zsh-users/zsh-completions
	# 快速跳转至文件夹
	zinit load agkozak/zsh-z
	# Enhanced colors for zsh
	# zinit load zpm-zsh/colors
	# Colorize command output using grc and lscolors
	# zinit load unixorn/warhol.plugin.zsh
	# zinit load MichaelAquilina/zsh-you-should-use
	zinit load mafredri/zsh-async
	# 🔖 Quickly navigate your work path!
	zinit load wfxr/formarks
	zinit load zdharma-continuum/history-search-multi-word
	zinit load trystan2k/zsh-tab-title

	# git clone depth
	# zinit ice depth=1
	zinit load romkatv/powerlevel10k
	# zinit ice depth=1
	# zinit light jeffreytse/zsh-vi-mode
	# if [[ -n "$(command -v fzf)" ]]; then
		# Replace zsh's default completion selection menu with fzf!
		# 似乎和其他插件有功能重复
		# zinit load chitoku-k/fzf-zsh-completions
		# zinit load Aloxaf/fzf-tab
		# zinit load unixorn/fzf-zsh-plugin
		# zinit load yuki-yano/fzf-preview.zsh
	# fi

	if [[ $(uname -s) == 'Darwin' ]]; then
		plugins=(macos brew)
		# zinit ice svn
		# zinit snippet  OMZ::plugins/macos
		# zinit snippet  OMZ::plugins/brew
	fi

	plugins+=(ag git gh rust history colored-man-pages extract fzf docker docker-compose z)
fi

HISTFILE="$HOME/.zsh_history" # The path to the history file.
HISTSIZE=50000                                          # The maximum number of events to save in the internal history.
SAVEHIST=50000                                          # The maximum number of events to save in the history file.

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ENABLE_BOXS_THEMES=true

# if [[ -n ${ENABLE_BOXS_THEMES} ]]; then
# 	source ${HOME}/.boxs/conf/zsh/themes/boxs.zsh-theme
# else
	ZSH_THEME="strug"
# fi

source $ZSH/oh-my-zsh.sh

# 用户自定义配置

[ -f ${BOXS_HOME}/conf/.boxsrc ] && source ${BOXS_HOME}/conf/.boxsrc

# 执行切换目录命令行自动执行下面命令
auto-color-ls() {
	emulate -L zsh
	echo
	exa --all --header --icons --git
}

chpwd_functions=(auto-color-ls $chpwd_functions)

export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
