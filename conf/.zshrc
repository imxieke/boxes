###
 # @Author: Cloudflying
 # @Date: 2021-09-19 01:49:42
 # @LastEditTime: 2023-05-21 21:57:42
 # @LastEditors: Cloudflying
 # @Description: zsh config file
### 
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

# Check zsh load time for debug
zmodload zsh/zprof
# init PATH
# 前面优先级高 覆盖系统自带的命令
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
# export MANPATH=''

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "~/.boxs/etc/p10k/p10k-instant-prompt.zsh" ]]; then
  source ~/.boxs/etc/p10k/p10k-instant-prompt.zsh
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
	zinit load zpm-zsh/colors
	# Colorize command output using grc and lscolors
	# zinit load unixorn/warhol.plugin.zsh
	zinit load MichaelAquilina/zsh-you-should-use
	zinit load mafredri/zsh-async
	# 🔖 Quickly navigate your work path!
	zinit load wfxr/formarks
	zinit load zdharma-continuum/history-search-multi-word
	zinit load trystan2k/zsh-tab-title

	# git clone depth
	zinit ice depth=1
	zinit load romkatv/powerlevel10k
	zinit ice depth=1
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

	plugins+=(ag git gh rust history colored-man-pages extract fzf docker docker-compose yarn z)
fi

HISTFILE="$HOME/.zsh_history" # The path to the history file.
HISTSIZE=50000                                          # The maximum number of events to save in the internal history.
SAVEHIST=50000                                          # The maximum number of events to save in the history file.

source $ZSH/oh-my-zsh.sh

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ENABLE_BOXS_THEMES=true

# if [[ -n ${ENABLE_BOXS_THEMES} ]]; then
# 	source ${HOME}/.boxs/conf/zsh/themes/boxs.zsh-theme
# else
	# ZSH_THEME="strug"
# fi

# 用户自定义配置

[ -f ~/.boxs/conf/.boxsrc ] && source ~/.boxs/conf/.boxsrc

# 执行切换目录命令行自动执行下面命令
auto-color-ls() {
	emulate -L zsh
	echo
	exa --all --header --icons --git
}

chpwd_functions=(auto-color-ls $chpwd_functions)

export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"