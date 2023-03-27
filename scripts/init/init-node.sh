#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 20:24:49
 # @LastEditTime: 2023-03-27 20:24:50
 # @LastEditors: Cloudflying
 # @Description: 
### 

_install()
{
	# Fabulously kill processes. Cross-platform
	npm install -g bower yarn grunt gulp webpack webpack-cli
	npm install -g fkill-cli
	npm install -g fx
	npm install -g nali-cli
	npm install -g tldr asar apidoc
	# bug scanner
	# npm install -g snyk@latest
	# intelephense php autocomplete PHP language server 
	npm i -g neovim 
	npm i -g intelephense bash-language-server typescript-language-server yaml-language-server-parser
	npm i -g prettier @prettier/plugin-php prettier-plugin-sh prettier-plugin-sql prettier-plugin-pkg @prettier/plugin-pug @prettier/plugin-xml prettier-plugin-java prettier-plugin-solidity prettier-plugin-toml
	# prettie-plugin-qml prettier-plugin-latex @prettier/plugin-ruby
	# @shopify/prettier-plugin-liquid prettier-plugin-go-template prettier-plugin-ssh-config @shufo/prettier-plugin-blade
	# prettier-plugin-tailwind prettier-plugin-tailwind-css prettier-plugin-tailwindcss prettier-plugin-ini prettier-plugin-apex eslint-plugin-prettier-vue
	# prettier-plugin-csharp prettier-plugin-tvmsolidity prettier-plugin-wxml prettier-plugin-kotlin prettier-plugin-nginx
}