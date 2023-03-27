#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-17 20:14:10
 # @LastEditTime: 2022-09-30 00:48:31
 # @LastEditors: Cloudflying
 # @Description:  
 # @FilePath: /.boxs/scripts/init/init-third-package-manager.sh
### 

init_platpak()
{
	flatpak install flathub com.usebottles.bottles
	flatpak run com.usebottles.bottles
}

init_snap()
{
	snap install snap-store
}