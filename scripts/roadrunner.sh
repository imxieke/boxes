#!/usr/bin/env bash

OS=$(uname -s | tr 'A-Z' 'a-z')
if [[ $(uname -m) == 'x86_64' ]]; then
	ARCH='amd64'
else
	echo "unsupport platform"
	exit 1
fi

# 无法访问 github 可替换为下面 url
# https://hub.fastgit.xyz
# 2.11.1
VER=$1
if [[ -z ${VER} ]]; then
	VER=$(curl -sI https://github.com/roadrunner-server/roadrunner/releases/latest | grep -Ei "https://github.com/roadrunner-server/roadrunner/releases/tag/v" | awk -F 'releases/tag/v' '{print $2}' | tr -d '\n\r')
fi

GRPC_URL="https://github.com/roadrunner-server/roadrunner/releases/download/v${VER}/protoc-gen-php-grpc-${VER}-${OS}-${ARCH}.zip"
ROADRUNNER_URL="https://github.com/roadrunner-server/roadrunner/releases/download/v${VER}/roadrunner-${VER}-${OS}-${ARCH}.zip"

TMP_DIR=$(mktemp -d)
echo ${TMP_DIR}
axel -k -v -a -n 4 ${GRPC_URL}
axel -k -v -a -n 4 ${ROADRUNNER_URL}


unzip protoc-gen-php-grpc-${VER}-${OS}-${ARCH}.zip
cp -fr protoc-gen-php-grpc-${VER}-${OS}-${ARCH}/protoc-gen-php-grpc ${HOME}/.bin

unzip roadrunner-${VER}-${OS}-${ARCH}.zip
cp -fr roadrunner-${VER}-${OS}-${ARCH}/rr ${HOME}/.bin

rm -fr ${TMP_DIR}