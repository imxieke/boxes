#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-17 20:14:35
 # @LastEditTime: 2024-05-08 20:37:30
 # @LastEditors: Cloudflying
 # @Description: init Alpine
###

# alpine 使用 musl 标准库 某些基于 gnu 编译的程序无法使用
# alpine 解压须使用 gnu tar 自带 tar 不支持管道

# deprecated
# alpine linux packages
_install()
{
	apk add --no-cache bash sudo wget curl git file less zsh jq fzf locales fortune
	apk add --no-cache python3-dev py3-pip
	# Editor
	apk add --no-cache neovim
	# Compress
	apk add --no-cache tar unzip p7zip zstd gzip
	# Dev
	# apk add --no-cache gcc musl-dev linux-headers
}