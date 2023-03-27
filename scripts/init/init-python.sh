#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 20:25:19
 # @LastEditTime: 2023-03-27 20:25:20
 # @LastEditors: Cloudflying
 # @Description: 
### 

_install()
{
	pip install psutil pip-search
	pip install protobuf msgpack requests
	pip install neovim python-lsp-server pyright pygls pylint pynvim python-language-server nginx-language-server
	# deps 
	# pyls
	pip install jedi==0.18.0
	pip install python-lsp-server[all]
}