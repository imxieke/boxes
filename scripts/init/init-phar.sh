#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-08-22 23:46:22
# @LastEditTime: 2024-05-14 01:23:10
# @LastEditors: Cloudflying
# @Description: Phar Manager {install update remove}
###

. ${BOXS_HOME}/scripts/function.sh

BIN_PATH=${HOME}/.bin
mkdir -p "${BIN_PATH}"

# TODO
# - build phar
# - phactor

# GIT_HOST="https://ghproxy.com"
GIT_HOST="https://github.com"
# GIT_HOST="https://gitclone.com" # error
# GIT_HOST="https://gh-proxy.com"

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
  DOWNLOADER='wget'
  if [[ -n "${2}" ]]; then
    _WGET_OUTPUT="-O $2"
    _AXEL_OUTPUT="-o $2"
  fi

  if [[ ${DOWNLOADER} == "axel" ]]; then
    axel -k -v -a -n 4 $1 $_AXEL_OUTPUT
  elif [[ ${DOWNLOADER} == "wget" ]]; then
    wget -c --no-check-certificate $1 $_WGET_OUTPUT
  fi
}

add_bin() {
  mkdir -p ${HOME}/.bin
  cd "${HOME}/.bin" || exit 1
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

# A tool for quickly measuring the size of a PHP project.
add_bin https://phar.phpunit.de/phploc.phar         ${BIN_PATH}/phploc
add_bin https://phar.phpunit.de/phpcpd.phar       ${BIN_PATH}/phpcpd
add_bin https://phpmd.org/static/latest/phpmd.phar  ${BIN_PATH}/phpmd
add_bin https://phar.io/releases/phive.phar         ${BIN_PATH}/phive
add_bin https://phar.phpunit.de/phpunit.phar 			${BIN_PATH}/phpunit
add_bin https://phar.phpbu.de/phpbu.phar            ${BIN_PATH}/phpbu
# 运行 PHPUnit 单元测试（包括测试结果和覆盖率报告）、文件转换（例如令牌替换、XSLT 转换、模板转换）
# 文件系统操作、交互式构建支持、SQL 执行、SCM 操作（Git、Subversion 和 Mercurial）、文档生成（PhpDocumentor、ApiGen）等等
add_bin https://www.phing.info/get/phing-latest.phar  ${BIN_PATH}/phing
add_bin https://phpdoc.org/phpDocumentor.phar         ${BIN_PATH}/phpDocumentor

add_bin https://doctum.long-term.support/releases/dev/doctum.phar   ${BIN_PATH}/doctum
add_bin https://www.laravel-enlightn.com/security-checker.phar      ${BIN_PATH}/security-checker


# last update on May 9, 2021
# Detect flaws in your architecture, before they drag you down into the depths of dependency hell ...
# fetch_latest_version_phar mihaeu/dephpend dephpend-0.8.0.phar ${BIN_PATH}/dephpend

# Commits on Apr 20, 2023 incompatible with PHP 8.2
# Documentation generator for PHP Code using standard technology (SRC, DOCBLOCK, XML and XSLT)
add_bin https://github.com/theseer/phpdox/releases/download/0.12.0/phpdox-0.12.0.phar ${BIN_PATH}/phpdox

# A lightweight php namespace aware autoload generator and phar archive builder
add_bin https://github.com/theseer/Autoload/releases/download/1.29.1/phpab-1.29.1.phar ${BIN_PATH}/phpab

# A CLI tool to check whether a specific composer package uses imported symbols that aren't part of its direct composer dependencies
fetch_latest_version_phar maglnet/ComposerRequireChecker composer-require-checker.phar ${BIN_PATH}/composer-require-checker

# Commits on Sep 15, 2023
# Beautiful and understandable static analysis tool for PHP
fetch_latest_version_phar phpmetrics/PhpMetrics phpmetrics.phar ${BIN_PATH}/phpmetrics

# PHP_Depend is an adaptation of the established Java development tool JDepend. This tool shows you the quality of your design in terms of extensibility, reusability and maintainability.
fetch_latest_version_phar pdepend/pdepend pdepend.phar ${BIN_PATH}/pdepend

# 🐛 A tool that can speed up linting of php files by running several lint processes at once.
fetch_latest_version_phar overtrue/phplint phplint.phar ${BIN_PATH}/phplint

# This tool check syntax of PHP files faster than serial check with fancier output.
fetch_latest_version_phar php-parallel-lint/PHP-Parallel-Lint parallel-lint.phar ${BIN_PATH}/parallel-lint

fetch_latest_version_phar PHP-CS-Fixer/PHP-CS-Fixer php-cs-fixer.phar ${BIN_PATH}/php-cs-fixer

# PHP Benchmarking framework
fetch_latest_version_phar phpbench/phpbench       phpbench.phar   ${BIN_PATH}/phpbench
# # PHP Static Analysis Tool - discover bugs in your code without running it!
fetch_latest_version_phar phpstan/phpstan 			  phpstan.phar 		${BIN_PATH}/phpstan
fetch_latest_version_phar deployphp/deployer      deployer.phar   ${BIN_PATH}/deployer
fetch_latest_version_phar phpro/grumphp           grumphp.phar    ${BIN_PATH}/grumphp
fetch_latest_version_phar vimeo/psalm 				    psalm.phar 			${BIN_PATH}/psalm
fetch_latest_version_phar phan/phan 					    phan.phar 			${BIN_PATH}/phan

# https://github.com/PHPCSStandards/PHP_CodeSniffer
# PHP_CodeSniffer tokenizes PHP files and detects violations of a defined set of coding standards.
add_bin https://phars.phpcodesniffer.com/phpcbf.phar 		${BIN_PATH}/phpcbf
add_bin https://phars.phpcodesniffer.com/phpcs.phar 			${BIN_PATH}/phpcs

# PHP Mutation Testing library
fetch_latest_version_phar infection/infection infection.phar ${BIN_PATH}/infection
fetch_latest_version_phar qossmic/deptrac deptrac.phar ${BIN_PATH}/deptrac

chmod +x ${BIN_PATH}/*
