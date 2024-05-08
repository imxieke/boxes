#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-09-17 20:14:10
# @LastEditTime: 2024-05-08 21:08:05
# @LastEditors: Cloudflying
# @Description:
###

init_platpak() {
  flatpak install flathub com.usebottles.bottles
  flatpak run com.usebottles.bottles
}

init_snap() {
  snap install snap-store
}
