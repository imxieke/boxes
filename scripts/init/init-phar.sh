#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-08-22 23:46:22
# @LastEditTime: 2024-05-14 01:23:10
# @LastEditors: Cloudflying
# @Description: Phar Manager {install update remove}
###

. ${BOXS_HOME}/scripts/function.sh

BIN_PATH=${HOME}/.local/boxs/bin

# TODO
# - build phar
# - phactor

GIT_HOST="https://ghproxy.com"

# username/repo
get_github_latest_version() {
  repo=$1
  url="${GIT_HOST}/${repo}/releases/latest"
  version=$(curl -sI "${url}" | grep -Ei "${GIT_HOST}/\S+releases/tag/" | awk -F 'releases/tag/' '{print $2}')
  if [[ -n "${version}" ]]; then
    echo "${version}"
  fi
}

# 从远程获取文件
# _fetch url save
function _fetch() {
  if [[ -n "${2}" ]]; then
    _WGET_OUTPUT="-O $2"
    _AXEL_OUTPUT="-o $2"
  fi

  if [[ -n "$(command -v axel)" ]]; then
    axel -k -v -a -n 4 $1 $_AXEL_OUTPUT
  elif [[ -n "$(command -v wget)" ]]; then
    wget -c --no-check-certificate $1 $_WGET_OUTPUT
  fi
}

add_bin() {
  mkdir -p ${HOME}/.bin
  cd ${HOME}/.bin
  if [[ ! -f "$2" ]]; then
    _fetch $1 $2
    chmod +x $2
  else
    echo $2 "has been downloaded"
  fi
}

fetch_latest_version_phar() {
  repo=$1
  filename=$2
  save=$3

  if [[ -f "${HOME}/.bin/$save" ]]; then
    echo "${save}" "has been downloaded"
  else
    ver=$(get_github_latest_version $1 | tr -d '\n\r')
    ver=$(echo -e "${ver}" | sed "s# ##g")
    [ -z "${repo}" ] && echo "repo param null" && exit 1
    [ -z "${filename}" ] && echo "filename param null" && exit 1
    [ -z "${save}" ] && echo "save param null" && exit 1
    [ -z "${ver}" ] && echo "ver is null, can't fetch latest version" && exit 1
    fullUrl="${GIT_HOST}/${repo}/releases/download/${ver}/${filename}"
    echo "Fetch ${save} ${ver}"
    add_bin "${fullUrl}" "${save}"
  fi
}

add_bin https://phpmd.org/static/latest/phpmd.phar ${BIN_PATH}/phpmd
# add_bin https://phar.phpunit.de/phpcpd.phar ${BIN_PATH}/phpcpd
add_bin https://phar.io/releases/phive.phar ${BIN_PATH}/phive
# add_bin https://phar.phpunit.de/phpunit.phar 						${BIN_PATH}/phpunit
add_bin https://phar.phpbu.de/phpbu.phar ${BIN_PATH}/phpbu
# 运行 PHPUnit 单元测试（包括测试结果和覆盖率报告）、文件转换（例如令牌替换、XSLT 转换、模板转换）、文件系统操作、交互式构建支持、SQL 执行、SCM 操作（Git、Subversion 和 Mercurial）、文档生成（PhpDocumentor、ApiGen）等等
add_bin https://www.phing.info/get/phing-latest.phar ${BIN_PATH}/phing
add_bin https://phpdoc.org/phpDocumentor.phar ${BIN_PATH}/phpDocumentor
add_bin https://doctum.long-term.support/releases/dev/doctum.phar ${BIN_PATH}/doctum

# A tool for quickly measuring the size of a PHP project.
add_bin https://phar.phpunit.de/phploc.phar ${BIN_PATH}/phploc
add_bin https://www.laravel-enlightn.com/security-checker.phar ${BIN_PATH}/security-checker
# Detect flaws in your architecture, before they drag you down into the depths of dependency hell ...
# last update on May 9, 2021
add_bin https://github.com/mihaeu/dephpend/releases/download/0.8.0/dephpend-0.8.0.phar ${BIN_PATH}/dephpend
# Documentation generator for PHP Code using standard technology (SRC, DOCBLOCK, XML and XSLT)
# Commits on Apr 20, 2023
add_bin https://github.com/theseer/phpdox/releases/download/0.12.0/phpdox-0.12.0.phar ${BIN_PATH}/phpdox
# A lightweight php namespace aware autoload generator and phar archive builder
add_bin https://github.com/theseer/Autoload/releases/download/1.29.1/phpab-1.29.1.phar ${BIN_PATH}/phpdox

# A CLI tool to check whether a specific composer package uses imported symbols that aren't part of its direct composer dependencies
add_bin https://github.com/maglnet/ComposerRequireChecker/releases/download/4.11.0/composer-require-checker.phar ${BIN_PATH}/composer-require-checker
add_bin https://github.com/phpmetrics/PhpMetrics/raw/master/releases/phpmetrics.phar ${BIN_PATH}/phpmetrics
# PHP Benchmarking framework
add_bin https://github.com/phpbench/phpbench/releases/download/1.2.15/phpbench.phar ${BIN_PATH}/phpbench

# fetch_github_latest_release FriendsOfPHP/PHP-CS-Fixer php-cs-fixer.phar ${BIN_PATH}/php-cs-fixer
# fetch_github_latest_release phpstan/phpstan 			phpstan.phar 		${BIN_PATH}/phpstan
fetch_github_latest_release deployphp/deployer deployer.phar ${BIN_PATH}/deployer
fetch_github_latest_release phpro/grumphp grumphp.phar ${BIN_PATH}/grumphp
# fetch_github_latest_release vimeo/psalm 				psalm.phar 			${BIN_PATH}/psalm
# fetch_github_latest_release phan/phan 					phan.phar 			${BIN_PATH}/phan
# fetch_github_latest_release squizlabs/PHP_CodeSniffer 	phpcbf.phar 		${BIN_PATH}/phpcbf
# fetch_github_latest_release squizlabs/PHP_CodeSniffer 	phpcs.phar 			${BIN_PATH}/phpcs
fetch_github_latest_release infection/infection infection.phar ${BIN_PATH}/infection
fetch_github_latest_release qossmic/deptrac deptrac.phar ${BIN_PATH}/deptrac

# Deprecated
# fetch_latest_version_phar mihaeu/dephpend 0.8.0/dephpend-0.8.0.phar dephpend
# fetch_latest_version_phar theseer/phpdox 0.12.0/phpdox-0.12.0.phar phpdox
# add_bin https://cs.symfony.com/download/php-cs-fixer-v3.phar php-cs-fixer

chmod +x ${BIN_PATH}/*

# Install Global Composer Package
if [[ -n "$(command -v composer)" ]]; then
  composer global require --dev vimeo/psalm
  composer global require --dev phan/phan
fi
