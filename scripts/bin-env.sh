#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-02 12:18:39
 # @LastEditTime: 2023-03-27 20:49:43
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

# if [[ -d "~/.cargo/bin" ]]; then
# 	echo "[+] export PATH cargo"
# 	export PATH="${HOME}/.cargo/bin:$PATH"
# fi

if [[ -d "/usr/games" ]]; then
	echo "[+] export PATH games"
	export PATH="$PATH:/usr/games"
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