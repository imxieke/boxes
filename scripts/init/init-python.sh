#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 20:25:19
 # @LastEditTime: 2023-09-10 12:51:10
 # @LastEditors: Cloudflying
 # @Description: 
### 

_install()
{
	pip install psutil pip-search
	pip install protobuf msgpack requests
	pip install neovim python-lsp-server pyright pygls pynvim python-language-server nginx-language-server
	# deps 
	# pyls
	pip install jedi==0.18.0
	pip install "python-lsp-server[all]"

	# Lint
	pip install sqlfluff yamllint
	pip install "pylint[spelling]"

	# Quick and reliable way to convert NGINX configurations into JSON and back.
	pip install crossplane
	pip install nginxfmt
	pip install pyndiff ujson tldr pyparsing pylint zope setuptools beautifulsoup4 gevent lxml podman-compose psutil msgpack protobuf packaging dill parso rope

	# Audits Python environments and dependency trees for known vulnerabilities
	pip install pip-audit
}