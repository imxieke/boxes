#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-06-06 23:40:32
# @LastEditTime: 2024-06-06 23:40:33
# @LastEditors: Cloudflying
# @Description: php-cs-fixer Link
###

if [[ -n "$(command -v php-cs-fixer)" ]]; then
  php-cs-fixer "$@"
fi
