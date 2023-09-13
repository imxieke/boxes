#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-05-22 15:13:30
 # @LastEditTime: 2023-05-31 22:35:41
 # @LastEditors: Cloudflying
 # @Description: Init VSCode
### 

if [[ -f "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]]; then
	ext="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
elif [[ -n "$(command -v code)" ]]; then
	ext="code"
fi

_ext_add()
{
	"$ext" --install-extension $@
}

_ext_add yzhang.markdown-all-in-one
_ext_add tabnine.tabnine-vscode
_ext_add mutable-ai.mutable-ai
_ext_add bierner.emojisense
_ext_add devsense.composer-php-vscode

# Gitpod
_ext_add gitpod.gitpod-desktop
_ext_add gitpod.gitpod-remote-ssh