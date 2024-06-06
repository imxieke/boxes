#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-06-06 23:11:18
# @LastEditTime: 2024-06-06 23:14:33
# @LastEditors: Cloudflying
# @Description: Phan Link
###

if [[ -n "$(command -v phan)" ]]; then
  phan "$@"
fi
