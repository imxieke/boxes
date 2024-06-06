#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-06-06 23:21:08
# @LastEditTime: 2024-06-06 23:21:09
# @LastEditors: Cloudflying
# @Description: PHPStan Link
###

if [[ -n "$(command -v phpstan)" ]]; then
  phpstan "$@"
fi
