#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-04-23 00:41:21
# @LastEditTime: 2024-05-14 01:23:53
# @LastEditors: Cloudflying
# @Description: Composer Global Init
###

# The Laravel application installer.
composer global require laravel/installer

# This tool check syntax of PHP files faster than serial check with fancier output.
composer global require --dev php-parallel-lint/php-parallel-lint

# Commits on Sep 15, 2023
# Beautiful and understandable static analysis tool for PHP
composer global require --dev phpmetrics/phpmetrics

# PHP Static Analysis Tool - discover bugs in your code without running it!
composer global require --dev phpstan/phpstan
# Composer plugin for automatic installation of PHPStan extensions.
# automatic load rules
composer global require --dev phpstan/extension-installer
# Extra strict and opinionated rules for PHPStan
composer global require --dev phpstan/phpstan-strict-rules
# PHP stubs extracted from php-src
composer global require --dev phpstan/php-8-stubs
# PHPUnit extensions and rules for PHPStan
composer global require --dev phpstan/phpstan-phpunit
# Next-gen phpDoc parser with support for intersection types and generics
composer global require --dev phpstan/phpdoc-parser
# 🔎 static analysis rules to prevent IEEE-754 floating point errors
# 似乎需要装在项目目录 并且在配置文件添加
composer global require --dev roave/no-floaters
# 👓 Provides a composer package with rules for phpstan/phpstan.
composer global require --dev ergebnis/phpstan-rules
composer global require --dev thecodingmachine/phpstan-strict-rules
# 需要单独配置
composer global require --dev slevomat/coding-standard

composer global require --dev pestphp/pest
composer global require --dev phpunit/phpunit
composer global require --dev friendsofphp/php-cs-fixer
composer global require --dev squizlabs/php_codesniffer
composer global require --dev vimeo/psalm
composer global require --dev phan/phan
# 🔰 Instant PHP quality checks from your console
composer global require --dev nunomaduro/phpinsights
# PHP Mutation Testing library
composer global require --dev -n infection/infection

composer global require --dev -n phpbench/phpbench

# Instant Upgrades and Automated Refactoring of any PHP 5.3+ code
composer global require --dev rector/rector

# Provides mechanisms for walking through any arbitrary PHP variable
composer global require --dev symfony/var-dumper
