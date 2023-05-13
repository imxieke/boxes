#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-02 12:18:39
 # @LastEditTime: 2023-04-18 00:45:59
 # @LastEditors: Cloudflying
 # @Description:  
 # @FilePath: /.boxs/scripts/bin-env.sh
### 

# 加载自定义目录二进制文件 垃圾的 macOS 还不能删
# PATH 放后头 系统是从前往后搜索

if [[ -d "${BOXS_HOME}/bin" ]]; then
	echo "[+] export PATH ${BOXS_HOME}/bin"
	export PATH="${BOXS_HOME}/bin:$PATH"
fi

if [[ -d "${HOME}/.bin" ]]; then
	echo "[+] export PATH ${HOME}/.bin"
	export PATH="${HOME}/.bin:$PATH"
fi

# 加载自定义版本 PHP
if [[ -d "/usr/local/opt/php@${PHP_VERSION}/bin" ]]; then
	echo "[+] export PATH PHP ${PHP_VERSION}"
	export PATH="/usr/local/opt/php@${PHP_VERSION}/bin:$PATH"
	export PATH="/usr/local/opt/php@${PHP_VERSION}/sbin:$PATH"
	export LDFLAGS="$LDFLAGS -L/usr/local/opt/php@${PHP_VERSION}/lib"
	export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/php@${PHP_VERSION}/include"
fi

# 覆盖系统自带的 python3
# if [[ -d "/usr/local/opt/python3" ]]; then
	# echo "[+] export PATH python3"
    # export PATH="/usr/local/opt/python3/bin:$PATH"
# fi

# PHP Composer
if [ -d ~/.composer/vendor/bin ];then
	echo "[+] export PATH composer"
	export PATH="${HOME}/.composer/vendor/bin:$PATH"
fi

# 第三方不能通过包管理的软件包
if [ -d ~/.local/boxs/bin ];then
	echo "[+] export PATH boxs"
	export PATH="${HOME}/.local/boxs/bin:$PATH"
fi

# if [[ -d "~/.cargo/bin" ]]; then
# 	echo "[+] export PATH cargo"
# 	export PATH="${HOME}/.cargo/bin:$PATH"
# fi

if [[ -d "/usr/games" ]]; then
	echo "[+] export PATH games"
	export PATH="$PATH:/usr/games"
fi

# 最新版本并覆盖所有其他版本 包括系统自带的
if [[ -d "/usr/local/opt/python3/bin/" ]]; then
	echo "[+] export PATH Python"
	export PATH="/usr/local/opt/python3/libexec/bin:$PATH"
fi

if [[ -d "/usr/local/games" ]]; then
	echo "[+] export PATH /usr/local/games"
	export PATH="$PATH:/usr/local/games"
fi

# if [[ -d "/usr/local/opt/coreutils/bin" ]]; then
	# echo "[+] export PATH coreutils"
	# export PATH="/usr/local/opt/coreutils/bin:$PATH"
# fi

if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
	echo "[+] export PATH gnu utils"
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

if [[ -d "/usr/local/opt/coreutils/libexec/gnuman" ]]; then
	echo "[+] export PATH gnu man"
	export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
fi

# if [[ -d "/usr/local/opt/mtr/sbin" ]]; then
	# echo "[+] export PATH mtr"
	# export PATH="/usr/local/opt/mtr/sbin:$PATH"
# fi

# if [[ -d "/usr/local/opt/universal-ctags/bin" ]]; then
	# echo "[+] export PATH ctags"
	# export PATH="/usr/local/opt/universal-ctags/bin:$PATH"
# fi

# if [[ -d "/usr/local/opt/ctags/bin" ]]; then
	# echo "[+] export PATH ctags"
	# export PATH="/usr/local/opt/ctags/bin:$PATH"
# fi

# load nvm
if [ -f ~/.local/boxs/shell/nvm.sh ];then
	export NVM_NODEJS_ORG_MIRROR=http://mirrors.ustc.edu.cn/node
	echo "[+] source ${HOME}/.local/boxs/shell/nvm.sh"
	source ~/.local/boxs/shell/nvm.sh
fi

# macOS 预置了老版本 需要覆盖
if [[ -f "/usr/local/opt/ruby/bin/gem" ]]; then
	export PATH="/usr/local/opt/ruby/bin:${PATH}"
  	export LDFLAGS="-L/usr/local/opt/ruby/lib ${LDFLAGS}"
  	export CPPFLAGS="-I/usr/local/opt/ruby/include ${CPPFLAGS}"
  	# export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig:${PKG_CONFIG_PATH}"
  	export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
fi