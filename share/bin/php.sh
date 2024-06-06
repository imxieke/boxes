#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-06-06 22:28:42
# @LastEditTime: 2024-06-06 22:34:59
# @LastEditors: Cloudflying
# @Description: PHP Link
###

if [[ -f "/usr/local/opt/php/bin/php" ]]; then
  /usr/local/opt/php/bin/php "$@"
elif [[ -n "$(command -v php)" ]]; then
  /usr/bin/php "$@"
elif [[ -f "/usr/bin/php" ]]; then
  /usr/bin/php "$@"
elif [[ -f "/bin/php" ]]; then
  /bin/php "$@"
fi
