#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-04-23 00:41:21
# @LastEditTime: 2024-04-24 21:50:58
# @LastEditors: Cloudflying
# @Description: Composer Global Init
###

composer global require --dev pestphp/pest
composer global require --dev phpunit/phpunit
composer global require --dev friendsofphp/php-cs-fixer
composer global require --dev squizlabs/php_codesniffer
composer global require --dev vimeo/psalm
composer global require --dev phan/phan
# 🔰 Instant PHP quality checks from your console
composer global require --dev nunomaduro/phpinsights

# Instant Upgrades and Automated Refactoring of any PHP 5.3+ code
composer global require --dev rector/rector

# Provides mechanisms for walking through any arbitrary PHP variable
composer global require --dev symfony/var-dumper
