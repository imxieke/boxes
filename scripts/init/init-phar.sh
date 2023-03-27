#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-08-22 23:46:22
 # @LastEditTime: 2023-03-27 22:10:05
 # @LastEditors: Cloudflying
 # @Description: Phar Manager {install update remove}
 # @FilePath: /.boxs/scripts/phar.sh
### 

# TODO
# - build phar
# - phactor

# https://hub.fastgit.org
# https://hub.fastgit.xyz
# https://github.com
# https://ghproxy.com
# https://gitclone.com/
GIT_HOST="https://hub.fastgit.xyz"

# username/repo
get_github_latest_version()
{
	repo=$1
	url="${GIT_HOST}/${repo}/releases/latest"
	version=$(curl -sI ${url} | grep -Ei "${GIT_HOST}/\S+releases/tag/" | awk -F 'releases/tag/' '{print $2}')
	if [[ -n "${version}" ]]; then
		echo ${version}
	fi
}

# 从远程获取文件
# _fetch url save
function _fetch()
{
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


add_bin()
{
	mkdir -p ${HOME}/.bin
	cd ${HOME}/.bin
	if [[ ! -f "$2" ]]; then
		_fetch $1 $2
    	chmod +x $2
	else
		echo $2 "has been downloaded"
	fi
}

fetch_latest_version_phar()
{
	repo=$1
	filename=$2
	save=$3

	if [[ -f "${HOME}/.bin/$save" ]]; then
		echo $save "has been downloaded"
	else
		ver=$(get_github_latest_version $1 | tr -d '\n\r')
		ver=$(echo -e $ver | sed "s# ##g")
		[ -z ${repo} ] && echo "repo param null" && exit 1
		[ -z ${filename} ] && echo "filename param null" && exit 1
		[ -z ${save} ] && echo "save param null" && exit 1
		[ -z ${ver} ] && echo "ver is null, can't fetch latest version" && exit 1
		fullUrl="${GIT_HOST}/${repo}/releases/download/${ver}/${filename}"
		echo "Fetch ${save} ${ver}"
		add_bin ${fullUrl} ${save}
	fi
}

add_bin https://phpmd.org/static/latest/phpmd.phar phpmd
add_bin https://phar.phpunit.de/phpcpd.phar phpcpd
add_bin https://phar.io/releases/phive.phar phive
add_bin https://phar.phpunit.de/phpunit.phar phpunit
add_bin https://phar.phpbu.de/phpbu.phar phpbu
add_bin https://www.phing.info/get/phing-latest.phar phing
add_bin https://phpdoc.org/phpDocumentor.phar phpDocumentor
add_bin https://doctum.long-term.support/releases/dev/doctum.phar doctum
add_bin https://phar.phpunit.de/phploc.phar phploc
add_bin https://www.laravel-enlightn.com/security-checker.phar security-checker

fetch_latest_version_phar FriendsOfPHP/PHP-CS-Fixer php-cs-fixer.phar php-cs-fixer
fetch_latest_version_phar phpstan/phpstan phpstan.phar phpstan

# mdzz 没有文件却发布了 版本还变低了
# fetch_latest_version_phar deployphp/deployer deployer.phar deployer
add_bin https://github.com/deployphp/deployer/releases/download/v7.0.0/deployer.phar deployer

fetch_latest_version_phar "phpro/grumphp" grumphp.phar grumphp
fetch_latest_version_phar vimeo/psalm psalm.phar psalm
fetch_latest_version_phar phan/phan phan.phar phan
fetch_latest_version_phar squizlabs/PHP_CodeSniffer phpcbf.phar phpcbf
fetch_latest_version_phar squizlabs/PHP_CodeSniffer phpcs.phar phpcs
fetch_latest_version_phar infection/infection infection.phar infection
fetch_latest_version_phar qossmic/deptrac deptrac.phar deptrac

# Deprecated
# fetch_latest_version_phar mihaeu/dephpend 0.8.0/dephpend-0.8.0.phar dephpend
# fetch_latest_version_phar theseer/phpdox 0.12.0/phpdox-0.12.0.phar phpdox
# add_bin https://cs.symfony.com/download/php-cs-fixer-v3.phar php-cs-fixer