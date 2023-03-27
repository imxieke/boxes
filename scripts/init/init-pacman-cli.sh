#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 20:13:06
 # @LastEditTime: 2023-03-27 20:19:40
 # @LastEditors: Cloudflying
 # @Description: Manjaro 和 Archlinux 软件源不同 Manjaro 软件比较多 
### 

# Manjaro 部分安装包在 Archlinux 内不存在 如 steam yay
_install()
{
	# Compress
	# GUI Archive: file-roller
	pacman -S --noconfirm bzip2 unzip unarchiver gzip tar p7zip unrar lzip lrzip xz zip zstd file-roller

	# Network
	pacman -S --noconfirm net-tools mtr traceroute dnsutils iputils lsof clash rsync

	# Language
	pacman -S --noconfirm python python-pip go nodejs npm jdk-openjdk

	# Tools
	# flameshot screenshot
	# shutter screenshot
	# jp2a A small utility for converting JPG images to ASCII
	# d-feet D-Bus debugger for GNOME
	# asciinema Record and share terminal sessions
	# vokoscreen 录屏
	pacman -S --noconfirm tree jq git fzf sudo file less zsh cowsay cowfortune htop lsb-release ntp

	# Package management
	pacman -S --noconfirm yay dpkg snapd

	# Git Tools
	# onefetch: like neofetch but for git
	# gitg GUI client to view git repositories.
	pacman -S --noconfirm git-delta onefetch gitg gitui

	# Blockchain
	# pacman -S --noconfirm go-ethereum openethereum

	# Downloader
	pacman -S --noconfirm axel wget curl

	# Editor
	pacman -S --noconfirm neovim
}