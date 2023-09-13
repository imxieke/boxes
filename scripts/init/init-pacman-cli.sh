#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 20:13:06
 # @LastEditTime: 2023-09-10 12:59:12
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
	# openbsd-netcat: nc command
	# corkscrew: tunneling SSH through HTTP proxies
	pacman -S --noconfirm net-tools mtr traceroute dnsutils iputils lsof clash rsync \
		openbsd-netcat corkscrew socat \
		syncthing \
		iperf iperf3

	# Language
	pacman -S --noconfirm python python-pip go nodejs npm jdk-openjdk

	# File && Code Tools
	pacman -S --noconfirm ripgrep the_silver_searcher

	# Tools
	# flameshot screenshot
	# shutter screenshot
	# jp2a A small utility for converting JPG images to ASCII
	# d-feet D-Bus debugger for GNOME
	# asciinema Record and share terminal sessions
	# vokoscreen 录屏
	pacman -S --noconfirm tree jq git fzf sudo file less zsh cowsay cowfortune htop lsb-release ntp mtools xsv exa \
		skim fd bat bat-extras

	# Package management
	# App Store
	pacman -S --noconfirm yay dpkg snapd

	# Security
	# osv-scanner Vulnerability scanner
	pacman -S --noconfirm nmap rustscan osv-scanner

	# Virtual Machine && Container
	# podman-docker conflict with docker
	pacman -S --noconfirm docker docker-buildx docker-compose docker-scan \
		podman podman-compose
	# Virtual Machine && Container Depency
	pacman -S --noconfirm fuse-overlayfs

	# Docker Tools
	# ctop like linux top
	# crun replace runc, crun is faster than runc and has a much lower memory footprint.
	# podman --runtime /usr/bin/crun run --rm --memory 4M fedora echo it works
	# cosign sign container image
	# dive A tool for exploring each layer in a docker image
	# skopeo Work with remote images registries - retrieving information, images, signing content
	pacman -S --noconfirm ctop container-diff crun cosign dive skopeo

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