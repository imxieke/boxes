#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-17 20:01:41
 # @LastEditTime: 2023-03-28 18:09:25
 # @LastEditors: Cloudflying
 # @Description: 可执行文件初始化 如 二进制文件 Shell Python 脚本
### 

mkdir -p ~/.local/boxs/bin
mkdir -p ~/.local/boxs/java
mkdir -p ~/.local/boxs/shell

JAVA_PATH=~/.local/boxs/java
BIN_PATH=~/.local/boxs/bin
SHELL_PATH=~/.local/boxs/shell
GITHUB_MIRROR='https://ghproxy.com/'

_install()
{
    echo "==> Fetch neofetch"
    curl -sL https://github.com/dylanaraps/neofetch/raw/master/neofetch             --output ~/.bin/neofetch

    echo "==> Fetch screenfetch"
    curl -sL https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev    --output ~/.bin/screenfetch

    echo "==> Fetch speedtest-cli"
    curl -sL https://github.com/sivel/speedtest-cli/raw/master/speedtest.py         --output ~/.bin/speedtest-cli

    echo "==> Fetch bashtop"
    curl -sL https://github.com/aristocratos/bashtop/raw/master/bashtop 			--output ~/.bin/bashtop

    echo "==> Fetch Python Httpstat"
    curl -sL https://raw.githubusercontent.com/reorx/httpstat/master/httpstat.py 	--output ~/.bin/httpstat-pu

    echo "==> Fetch Bash Httpstat"
	curl -fsSL https://github.com/b4b4r07/httpstat/raw/master/httpstat.sh 			--output ~/.bin/httpstat.sh

	if [[ ! -f ~/.bin/speedtest ]]; then
		echo "==> Fetch ookla speedtest.net cli speed test for Linux"
        curl -sL https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz | tar -C ~/.bin/ -xvf - speedtest
	fi

	# Use AirPlay Stream to UPnP/Sonos & Chromecast devices
	if [[ ! -f ~/.bin/aircast ]];then
    	echo "==> Fetch AirCast"
    	curl -sL https://github.com/philippe44/AirConnect/raw/master/bin/aircast-x86-64 --output ~/.bin/aircast
	fi

	if [[ ! -f ~/.bin/airupnp ]]; then
    	echo "==> Fetch AirUpnp"
    	curl -sL https://github.com/philippe44/AirConnect/raw/master/bin/airupnp-x86-64 --output ~/.bin/airupnp
	fi

    echo "==> Fetch nexttrace"
	curl -fsSL "${GITHUB_MIRROR}https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_darwin_amd64" 			--output ~/.bin/nexttrace

    echo "==> Fetch nexttrace experiment"
	curl -fsSL "${GITHUB_MIRROR}https://github.com/OwO-Network/nexttrace-experiment/releases/latest/download/nexttrace_darwin_amd64" 			--output ~/.bin/nexttrace-plus

    echo "==> Fetch dex2jar"
	curl -fsSL "${GITHUB_MIRROR}https://github.com/pxb1988/dex2jar/releases/download/v2.1/dex2jar-2.1.zip" 			--output /tmp/dex2jar-2.1.zip
	unzip -qo /tmp/dex2jar-2.1.zip -d ${JAVA_PATH}
	rm -fr /tmp/dex2jar-2.1.zip
	mv ${JAVA_PATH}/dex-tools-2.1 ${JAVA_PATH}/dex-tools

    echo "==> Fetch Java Decompiler gui"
	curl -fsSL "${GITHUB_MIRROR}https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar" 			--output ${JAVA_PATH}/jd-gui.jar

    echo "==> Fetch procyon Decompiler"
	curl -fsSL "${GITHUB_MIRROR}https://github.com/mstrobel/procyon/releases/download/v0.6.0/procyon-decompiler-0.6.0.jar" 			--output ${JAVA_PATH}/procyon-decompiler.jar
}

# 无法直接执行的脚本
_install_scripts()
{
	echo "==> Fetch nvm.sh"
	curl -fsSL "${GITHUB_MIRROR}https://raw.githubusercontent.com/nvm-sh/nvm/master/nvm.sh" 			--output ${SHELL_PATH}/nvm.sh
}

_install_scripts