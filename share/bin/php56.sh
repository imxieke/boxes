#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-06-06 23:33:11
# @LastEditTime: 2024-06-06 23:33:12
# @LastEditors: Cloudflying
# @Description: PHP 5.6 Link
###

PHP_VERSION=56
if [[ -f "/usr/local/opt/php@${PHP_VERSION:0:1}.${PHP_VERSION:1:1}/bin/php" ]]; then
  "/usr/local/opt/php@${PHP_VERSION:0:1}.${PHP_VERSION:1:1}/bin/php" "$@"
elif [[ -n "$(command -v php${PHP_VERSION})" ]]; then
  "/usr/bin/php${PHP_VERSION}" "$@"
elif [[ -f "/usr/bin/php${PHP_VERSION}" ]]; then
  "/usr/bin/php${PHP_VERSION}" "$@"
elif [[ -f "/bin/php${PHP_VERSION}" ]]; then
  "/bin/php${PHP_VERSION}" "$@"
elif [[ -f "/www/server/php/${PHP_VERSION}/bin/php" ]]; then
  "/www/server/php/${PHP_VERSION}/bin/php" "$@"
fi
