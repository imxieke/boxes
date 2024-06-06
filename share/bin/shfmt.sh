#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-06-06 22:25:00
# @LastEditTime: 2024-06-06 22:26:17
# @LastEditors: Cloudflying
# @Description: shfmt link
###

if [[ -f "/usr/local/bin/shfmt" ]]; then
  /usr/local/bin/shfmt "$@"
elif [[ -f "/usr/bin/shfmt" ]]; then
  /usr/bin/shfmt "$@"
elif [[ -f "/bin/shfmt" ]]; then
  /bin/shfmt "$@"
fi
