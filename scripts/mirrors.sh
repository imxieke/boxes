#!/usr/bin/env bash
# TODO pip docker go
# https://doc.nju.edu.cn/books/35f4a

_red() {
    printf '\033[1;31;31m%b\033[0m' "$1"
}

_green() {
    printf '\033[1;31;32m%b\033[0m' "$1"
}

_yellow() {
    printf '\033[1;31;33m%b\033[0m' "$1"
}

_info() {
    _green "[Info] "
    printf -- "%s" "$1"
    printf "\n"
}

_warn() {
    _yellow "[Warning] "
    printf -- "%s" "$1"
    printf "\n"
}

_error() {
    _red "[Error] "
    printf -- "%s" "$1"
    printf "\n"
    exit 1
}

# https://mirrors.tencent.com/composer/composer.phar
# https://mirrors.aliyun.com/composer/composer.phar
_composer()
{
	case $1 in
		offcial )
			composer config -g repo.packagist composer https://repo.packagist.org
			;;
		aliyun )
			composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
			;;
		tencent )
			composer config -g repo.packagist composer https://mirrors.tencent.com/composer/
			;;
		huawei )
			composer config -g repo.packagist composer https://mirrors.huaweicloud.com/repository/php/
			;;
		sjtug )
			composer config -g repo.packagist composer https://packagist.mirrors.sjtug.sjtu.edu.cn
			;;
		cloudflare|cf )
			# Global Cloudflare
			composer config -g repo.packagist composer https://packagist.pages.dev
			;;
		phpcomposer|pc )
			composer config -g repo.packagist composer https://packagist.phpcomposer.com
			;;
		* )
			echo "Usage: $(_yellow 'bash mirrors.sh composer aliyun')" 
			echo "provider: [offcial|aliyun|tencent|huawei|sjtug|cloudflare(cf)|phpcomposer(pc)]"
			;;
	esac
	_green "Configration , Set Completion!"
	echo "unset mirrors? use $(_red 'composer config -g --unset repos.packagist')"
}


_npm()
{
	case $1 in
		offcial )
			# yarn https://registry.yarnpkg.com
			npm config set registry composer https://registry.npmjs.org
			;;
		aliyun )
			npm config set registry composer https://registry.npmmirror.com/
			;;
		tencent )
			npm config set registry composer http://mirrors.cloud.tencent.com/npm/
			;;
		huawei )
			npm config set registry composer https://mirrors.huaweicloud.com/repository/npm/
			;;
		ustc )
			npm config set registry composer https://npmreg.proxy.ustclug.org
			;;
		nju )
			npm config set registry composer https://repo.nju.edu.cn/repository/npm/
			;;
		zju )
			npm config set registry composer https://mirrors.zju.edu.cn/npm
			;;
		* )
			echo "Usage: $(_yellow 'bash mirrors.sh npm aliyun')" 
			echo "provider: [offcial|aliyun|tencent|huawei|ustc|nju|zju]"
			;;
	esac
	_green "Configration , Set Completion!"
}

_ruby()
{
	case $1 in
		offcial )
			# yarn https://registry.yarnpkg.com
			npm config set registry composer https://registry.npmjs.org
			;;
		aliyun )
			npm config set registry composer https://registry.npmmirror.com/
			;;
		tencent )
			npm config set registry composer http://mirrors.cloud.tencent.com/npm/
			;;
		huawei )
			npm config set registry composer https://mirrors.huaweicloud.com/repository/npm/
			;;
		ustc )
			npm config set registry composer https://npmreg.proxy.ustclug.org
			;;
		nju )
			npm config set registry composer https://repo.nju.edu.cn/repository/npm/
			;;
		zju )
			npm config set registry composer https://mirrors.zju.edu.cn/npm
			;;
		* )
			echo "Usage: $(_yellow 'bash mirrors.sh npm aliyun')" 
			echo "provider: [offcial|aliyun|tencent|huawei|ustc|nju|zju]"
			;;
	esac
	_green "Configration , Set Completion!"
}

_usage()
{
	echo "
		国内镜像设置
	"
}

pkg_name=$1

case ${pkg_name} in
	composer )
		_composer ${@:2}
		;;
	npm )
		_npm ${@:2}
		;;
	ruby )
		_ruby ${@:2}
		;;
	*)
		_usage
		;;
esac