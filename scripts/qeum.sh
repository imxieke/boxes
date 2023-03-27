#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-27 14:55:59
 # @LastEditTime: 2022-09-27 15:05:16
 # @LastEditors: Cloudflying
 # @Description: 
### 
qemu-system-x86_64 \
	-m 4096M \
	-k us \
	-name 'qemu vm'
	-serial mon:stdio \
	-netdev user,id=eth0,hostfwd=tcp::8080-:80 \
	-device e1000,netdev=eth0 \
	-cdrom /Users/imxieke/Downloads/FreeBSD-13.1-RELEASE-amd64-dvd1.iso