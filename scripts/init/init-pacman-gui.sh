#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-12 22:14:17
 # @LastEditTime: 2023-03-27 20:20:21
 # @LastEditors: Cloudflying
 # @Description: 
 # @FilePath: /.boxs/scripts/init/init-pacman.sh
### 

_install()
{
	# pkgfile pacman .files metadata explorer
	pacman -S --noconfirm pkgfile

	# Tools
	# flameshot screenshot
	# shutter screenshot
	# jp2a A small utility for converting JPG images to ASCII
	# d-feet D-Bus debugger for GNOME
	# asciinema Record and share terminal sessions
	# vokoscreen 录屏
	pacman -S --noconfirm psmisc lolcat flameshot shutter jp2a d-feet kweather \
		gnome-usage gnome-system-monitor gnome-maps \
		marble-maps \
		activity-log-manager asciinema vokoscreen

	# Aur: etcher

	# Deepin
	# deepin-system-monitor replace by kde system monitor
	pacman -S --noconfirm deepin-screen-recorder deepin-album deepin-calculator deepin-calendar deepin-diskmanager \
		deepin-draw deepin-font-manager deepin-image-viewer deepin-mail deepin-movie deepin-picker deepin-reader

	# File
	# easytag Simple application for viewing and editing tags in audio files
	# meld visual diff and merge tool for files, folders and version control.
	# File Manager: nautilus
	pacman -S --noconfirm diffutils easytag meld nautilus gnome-disk-utility

	# Database Client
	pacman -S --noconfirm mariadb-clients sqlitebrowser

	# Chat
	# aur slack-desktop
	# fractal Matrix messaging client
	# hexchat A popular and easy to use graphical IRC (chat) client
	# polari An IRC Client for GNOME
	pacman -S --noconfirm discord fractal hexchat polari

	# Documents
	# yelp views Mallard, DocBook, man, info, and HTML documents
	pacman -S --noconfirm calibre evince \
		yelp yelp-tools yelp-xsl \
		gnome-books \
		xreader xfce4-dict

	# BitTorrent && Downloader
	pacman -S --noconfirm deluge qbittorrent ktorrent transmission-gtk aria2 uget

	# Productive Video && Audio Editor
	# pitivi Editor for audio/video projects using the GStreamer framework, beautiful and intuitive 
	pacman -S --noconfirm pitivi

	# Security
	pacman -S --noconfirm metasploit ghidra jadx

	# Editor
	# gtk markdown editor
	pacman -S --noconfirm code gedit deepin-editor marker ghex gnome-builder

	# Wine
	pacman -S --noconfirm wine vkd3d wine-gecko winetricks

	# Pictures
	# picture view: ristretto pix
	# shotwell A digital photo organizer designed for the GNOME desktop environment
	pacman -S --noconfirm nomacs ristretto pix gthumb eog shotwell digikam gnome-photos photoflare

	# MultiMedia Player
	# smplayer Media player with built-in codecs that can play virtually all video and audio formats
	pacman -S --noconfirm vlc kmplayer mpv dragon smplayer smplayer celluloid \
		gnome-subtitles

	# Music Player
	# lollypop Music player for GNOME
	# rhythmbox A GTK client for MPD inspired by Rhythmbox but much lighter and faster
	pacman -S --noconfirm deepin-music gnome-music lollypop rhythmbox

	# Development
	# 下面两个用暂时不到
	# sagemath Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab
	# sagemath matplab 开源替代品
	# qtcreator Lightweight, cross-platform integrated development environment
	# pacman -S --noconfirm sagemath qtcreator

	# Electron
	pacman -S --noconfirm asar electron electron18

	# Databases
	# kexi A visual database applications creator
	# dbeaver Free universal SQL Client for developers and database administrators (community edition) java
	# pacman -S --noconfirm mysql-workbench kexi \
		# dbeaver dbeaver-plugin-office

	# Games
	# 不玩游戏 谢谢
	# steam 滚啊
	# lutris 开源游戏平台
	# gnome-games gnome 游戏客户端
	# pacman -S --noconfirm lutris
	pacman -S --noconfirm gnome-2048 gnome-robots gnome-nibbles atomix five-or-more gnome-klotski gnome-mines \
		gnome-sudoku swell-foop gnome-taquin gnome-tetravex gnome-games

	# Browser
	# aur tor-browser edge google-chrome
	pacman -S --noconfirm \
		vivaldi vivaldi-ffmpeg-codecs \
		firefox firefox-i18n-zh-cn \
		firefox-developer-edition firefox-developer-edition-i18n-zh-cn \
		chromium \
		falkon

	# Office
	# libreoffice-fresh beta version
	pacman -S --noconfirm libreoffice-fresh libreoffice-fresh-zh-cn libreoffice-extension-texmaths libreoffice-extension-writer2latex \
	

	# Desktop
	# Budgie Desktop
	# pacman -S --noconfirm budgie-desktop budgie-desktop-view budgie-extras budgie-screensaver budgie-sysmonitor-applet budgie-wallpapers

	# KDE Plasma Desktop
	# pacman -S --noconfirm plasma kde-graphics kde-multimedia kde-network kde-pim kde-system kde-utilities kde-games kde-applications
	# KDE Applications
	# 等待研究 仅安装所需要的程序
	# pacman -S --noconfirm kde-graphics kde-multimedia kde-network kde-pim kde-system kde-utilities kde-games kde-applications
	# pacman -S --noconfirm dolphin-plugins

	# SDDM 仅对于非 sddm 桌面环境管理器
	# pacman -S --noconfirm sddm sddm-kcm
	# systemctl enable sddm.service

	# Deepin Desktop
	# pacman -S --noconfirm deepin deepin-extra

	# pacman -S --noconfirm gnome gnome-extra

	# pacman -S --noconfirm mate mate-extra

	# Linux Mint Desktop
	# pacman -S --noconfirm cinnamon

	# Ubuntu Kylin Desktop
	# pacman -S --noconfirm ukui

	# ElementaryOS Desktop conflict with Deepin Desktop
	# pacman -S --noconfirm pantheon
	# pacman -S --noconfirm xfce4 xfce4-goodies
	# Kernel
	# pacman -S --noconfirm linux-firmware linux-api-headers

	# Productive
	# pacman -S --noconfirm thunderbird thunderbird-i18n-zh-cn
	# Input Method
	pacman -S --noconfirm fcitx fcitx-configtool fcitx-sogoupinyin
	# 修复缺失库
	pacman -S --noconfirm libvoikko nuspell hspell
	# pacman -S --noconfirm fcitx5 fcitx5-configtool fcitx5-chinese-addons
	# KDE Application
	# labplot graphing and analysis of scientific data
	# kdenlive A non-linear video editor for Linux using the MLT video framework
	# ksysguard System Monitor
	# kile A user friendly TeX/LaTeX frontend for KDE
	# okteta hex editor for viewing and editing the raw data
	# krusader Advanced twin panel (commander style) file manager
	# calligra A set of applications for productivity and creative usage
	# index-fm Multi-platform file manager
	# apper An application and package manager using PackageKit
	# pikasso Image gallery application
	# alligator RSS Feed Reader
	# pix Image viewer and browser based on gthumb
	# kclock Simple Clock application for Mobile Devices running Plasma
	# kalk Cross-platfrom calculator built with the Kirigami framework
	# kweather Weather App
	# calligra-plan A project management application intended for managing moderately large projects with multiple resources
	# kbibtex An editor for bibliographies used with LaTeX
	# aur: pikasso
	# TODO: 待研究 似乎不是全部都有用
	# pacman -S --noconfirm labplot kdenlive kdevelop ksysguard kile okteta krusader calligra index-fm \
		# apper alligator pix kclock kalk kweather calligra-plan kbibtex

	# 图像处理 3D 建模等
	# blender 创建 3D 模型和动画场景
	# inkscape 矢量图形编辑器
	# gimp
	# darktable Utility to organize and develop raw images
	# openshot a simple video editor
	# shotcut Video Editor
	# krita Edit and paint images
	pacman -S --noconfirm inkscape openshot shotcut blender \
		ffmpeg \
		gimp gimp-help-zh_cn gimp-plugin-gmic \
		krita

	# gmic GREYC's Magic Image Converter: image processing framework
	# pacman -S --noconfirm gmic

	# pacman -S --noconfirm gpart gparted parted

	# remmina remote desktop client written in GTK+
	pacman -S --noconfirm remmina gnome-connections filezilla vinagre teamviewer

	# Android
	pacman -S --noconfirm android-tools

	# Fonts
	# noto-fonts google noto fonts
	# ttf-ubuntu-font-family: Ubuntu Mono
	pacman -S --noconfirm adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts \
		ttf-jetbrains-mono \
		wqy-microhei wqy-zenhei \
	 	noto-fonts \
		nerd-fonts-noto-sans-mono \
		ttf-fira-code ttf-fira-mono ttf-ubuntu-font-family

	# Tools
	# figlet making large letters out of ordinary text
	# asciiquarium 数字海洋馆
	# sl ASCII 小火车
	# see hardware info
	# peek GIF screen recorder
	pacman -S --noconfirm figlet asciiquarium sl dmidecode sshfs supervisor \
		gnome-logs gnome-calculator gnome-dictionary ocrfeeder peek gnome-podcasts \
		mdcat
	
	# 镜像烧录
	# xfburn brasero gnome-multi-writer

	# Virtual Machine && Container
	# gnome-boxes
	# use kernel version
	# pacman -S --noconfirm \
		# docker \
		# libvirt \
		# qemu-system-x86 qemu-virtiofsd
	
	# VirtualBox 如果在 Linux 类系统完全没必要安装虚拟机
	# pacman -S --noconfirm virtualbox virtualbox-guest-utils virtualbox-host-dkms linux518-virtualbox-host-modules
	# 仅运行在vbox虚拟机内
	# systemctl enable vboxservice.service
}