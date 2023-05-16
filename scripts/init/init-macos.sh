#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-17 20:02:52
 # @LastEditTime: 2023-05-14 03:32:02
 # @LastEditors: Cloudflying
 # @Description: init package for macOS brew package manager
 # @FilePath: /.boxs/scripts/init/init-macos.sh
### 

# 初始化 brew 使用 大陆镜像 提高下载速度
init_brew()
{
	# https://mirrors.cloud.tencent.com/homebrew/
	# http://mirrors.ustc.edu.cn/
	[ -z "$(command -v brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [[ -n "$(command -v brew)" ]]; then
		echo "==> Set Brew and tap mirrors"
		# Brew
		git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

		# Cask
		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask ]]; then
			git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
		else
			brew tap homebrew/cask https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
		fi

		# Core
		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core ]]; then
			# trunk-ignore(shellcheck/SC2312)
			git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
		else
			brew tap homebrew/core https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
		fi

		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-services ]]; then
			git -C "$(brew --repo homebrew/services)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git
		else
			brew tap homebrew/services https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git
		fi

		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-versions ]]; then
			git -C "$(brew --repo homebrew/cask-versions)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
		else
			brew tap homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
		fi

		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-versions ]]; then
			git -C "$(brew --repo homebrew/cask-versions)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
		else
			brew tap homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
		fi

		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-drivers ]]; then
			git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
		else
			brew tap homebrew/cask-drivers https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
		fi

		if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-fonts ]]; then
			git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
		else
			brew tap homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
		fi
    	# git branch --set-upstream-to=origin/master master

    	# Remove a formula and its unused dependencies
    	# brew tap beeftornado/rmtree

	fi
}

init_pkgs()
{
	# System Depency
	brew install coreutils

	# Dev
	# brew install gcc make cmake xmake autoconf automake

	brew install git subversion tldr ccat zsh git fzf htop imagemagick meofetch squashfs syncthing tree curl whois
	# duf Disk Usage/Free Utility - a better 'df' alternative
	# gitui Blazing 💥 fast terminal-ui for git written in rust 🦀
	brew install fd td exa ghq hub gh duf gitui

	# bitwarden Password Manager
	# balenaetcher flash mirror file to disk or Removable disk
	brew install bitwarden-cli balenaetcher

	# Compress
	brew install unar unzip xz zstd brotli

	# File Content View
	# sk skim fuzzy file search
	brew install ccat bat mdcat sk

	# Remote
	brew install vnc-viewer telnet

	# gron Make JSON greppable!
	brew install jq ccat gron exa ctop grex fd sd bat xsv jo
	
	# Database
	brew install mysql@5.7 redis sqlite

	# Tools
	# grc Colorize logfiles and command output
	# fortune show quotes
	# fzf Command-line fuzzy finder written in Go
	# git-delta A syntax-highlighting pager for git, diff, and grep output
	brew install cowsay grc fortune procs fzf supervisor git-delta

	# ntfs
	# brew install mounty

	# MultiMedia
	brew install iina qqplayer qqmusic neteasemusic kugoumusic ffmpeg

	# input
	brew install sogouinput
	brew install eudic

	# Network Tools
	# cli dns query
	brew install clash whois dog rsync iperf iperf3

	# Chat
	brew install telegram wechat qq discord

	# Fonts
	brew install font-fontawesome font-fira-mono-nerd-font font-hack-nerd-font font-jetbrains-mono-nerd-font font-mononoki-nerd-font \
		font-noto-color-emoji font-noto-emoji font-ubuntu-mono-nerd-font font-ubuntu-nerd-font

	# duti Select default apps for documents and URL schemes on macOS
	# mas macos app store interface
	brew install duti mas

	# Downloader
	brew install wget axel free-download-manager aria2 motrix

	# Programming language
	# go node python python2 python3 pip pip2 pip3 php composer ruby perl java
	brew install shivammathur/php/php shivammathur/php/php@5.6 shivammathur/php/php@7.4 shivammathur/php/php@8.0 go python dotnet kotlin node@14 openjdk
	brew install shivammathur/extensions/amqp@7.4 shivammathur/extensions/imagick@7.4 shivammathur/extensions/imap@7.4 shivammathur/extensions/memcache@7.4 shivammathur/extensions/memcached@7.4 shivammathur/extensions/mongodb@7.4 shivammathur/extensions/msgpack@7.4 shivammathur/extensions/protobuf@7.4 shivammathur/extensions/rdkafka@7.4 shivammathur/extensions/redis@7.4 shivammathur/extensions/ssh2@7.4 shivammathur/extensions/swoole@7.4 shivammathur/extensions/vips@7.4 shivammathur/extensions/xlswriter@7.4 shivammathur/extensions/yaml@7.4 shivammathur/extensions/zmq@7.4
	brew install shivammathur/extensions/amqp@8.0 shivammathur/extensions/imagick@8.0 shivammathur/extensions/imap@8.0 shivammathur/extensions/memcache@8.0 shivammathur/extensions/memcached@8.0 shivammathur/extensions/mongodb@8.0 shivammathur/extensions/msgpack@8.0 shivammathur/extensions/protobuf@8.0 shivammathur/extensions/rdkafka@8.0 shivammathur/extensions/redis@8.0 shivammathur/extensions/ssh2@8.0 shivammathur/extensions/swoole@8.0 shivammathur/extensions/vips@8.0 shivammathur/extensions/xlswriter@8.0 shivammathur/extensions/yaml@8.0 shivammathur/extensions/zmq@8.0
	brew install shivammathur/extensions/amqp@8.1 shivammathur/extensions/imagick@8.1 shivammathur/extensions/imap@8.1 shivammathur/extensions/memcache@8.1 shivammathur/extensions/memcached@8.1 shivammathur/extensions/mongodb@8.1 shivammathur/extensions/msgpack@8.1 shivammathur/extensions/protobuf@8.1 shivammathur/extensions/rdkafka@8.1 shivammathur/extensions/redis@8.1 shivammathur/extensions/ssh2@8.1 shivammathur/extensions/swoole@8.1 shivammathur/extensions/vips@8.1 shivammathur/extensions/xlswriter@8.1 shivammathur/extensions/yaml@8.1 shivammathur/extensions/zmq@8.1

	# Language Server Protocol
	# brew install lua-language-server kotlin-language-server

	# Options
	# brew install swift ruby@2.7 rust kotlin node@16
	# brew install --cask dotnet dotnet-sdk
	# Programming language Tools
	# brew install composer
	# Editor and IDE
	brew install neovim visual-studio-code sublime-text android-studio

	# Graphical client for Git version control
	# sourcetree replace with git cli
	# brew install sourcetree

	# Web Browser
	brew install google-chrome firefox-developer-edition chromium microsoft-edge tor-browser

	# Android Tools
	brew install android-platform-tools

	# Terminal
	brew install iterm2

	# export windows package file lists (.exe)
	brew install innoextract

	# Documents && Markdown
	brew install mdv mdp koodo-reader

	# Version Control
	brew install gh git svn git-svn

	# Virtual Box
	# brew install virtualbox vagrant lima podman qemu multipass

	# Utils
	brew install ctags

	# Download form App Store
	# 944848654 Netease Music
	# 1352778147 BitWarden
	# 747648890 Telegram
	# 451108668 QQ
	# 1119452668 Kuwo
	# 1443749478 Wps
	# 1314842898 Tencent Kantu PicView
	# 408981434 iMovie
	# 409183694 KeyNote
	# 409203825 Numbers
	# 409201541 Pages
	# 836500024 WeChat
	mas install 944848654 1352778147 747648890 451108668 1119452668 1443749478 1314842898 408981434 409183694 409203825 409201541 836500024
}

init_bin()
{
	# Use AirPlay to stream to UPnP/Sonos & Chromecast devices
	if [[ ! -f ~/.bin/aircast ]];then
    	echo "==> Fetch AirCast"
    	curl -sL https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-osx-multi --output ~/.bin/aircast
	fi

	if [[ ! -f ~/.bin/airupnp ]]; then
    	echo "==> Fetch AirUpnp"
    	curl -sL https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-osx-multi --output ~/.bin/airupnp
	fi

	if [[ ! -f ~/.bin/speedtest ]]; then
		echo "==> Fetch ookla speedtest.net cli speed test for macOS"
    	curl -sL https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-macosx-x86_64.tgz | tar -C ~/.bin/ -xvf - speedtest
	fi
}