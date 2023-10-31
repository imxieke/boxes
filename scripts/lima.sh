#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-10-27 17:58:24
 # @LastEditTime: 2023-10-27 18:20:08
 # @LastEditors: Cloudflying
 # @Description: Lima Init
### 
limactl create \
	--name=default \
	--arch=x86_64 \
	--cpus=2 \
	--memory=4 \
	--disk=64 \
	--mount-writable \
	--mount-type=9p \
	--vm-type=qemu \
	template://archlinux