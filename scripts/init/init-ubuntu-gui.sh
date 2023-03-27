#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 19:21:29
 # @LastEditTime: 2023-03-27 20:10:25
 # @LastEditors: Cloudflying
 # @Description: Init Ubuntu GUI
### 

_install()
{
	# Browser
	# chromium-browser firefox

	# for virtualbox or in virtualbox Container
	if [[ -n "$(command -v vbox-img)" ]]; then
		apt install --no-install-recommends linux-headers-$(uname -r) linux-tools-$(uname -r)
		# for build virtualbox enhance feature (Guest addition cd image)
		apt install --no-install-recommends gcc make perl
	fi
}