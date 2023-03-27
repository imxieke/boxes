#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-03-27 20:23:30
 # @LastEditTime: 2023-03-28 00:27:09
 # @LastEditors: Cloudflying
 # @Description: 
###

_install()
{
	mkdir -p ~/.go/bin            # 包含可执行文件，如：编译器，Go 工具
	mkdir -p ~/.go/src            # 包含源代码构建脚本和标准库的包的完整源代码（Go 是一门开源语言）
	mkdir -p ~/.go/doc            # 包含示例程序，代码工具，本地文档等
	mkdir -p ~/.go/lib            # 包含文档模版
	mkdir -p ~/.go/misc           # 包含与支持 Go 编辑器有关的配置文件以及 cgo 的示例
	mkdir -p ~/.go/os_arch        # 包含标准库的包的对象文件（.a）
	mkdir -p ~/.go/cmd            # 包含 Go 和 C 的编译器和命令行脚本
	export GOPATH="${HOME}/.go"
	export GOBIN="${GOPATH}/bin"
	export GOSRC="${GOPATH}/src"
	export PATH="$PATH:$GOBIN"
	export GOPROXY=https://proxy.golang.com.cn,direct
	# Pure Go implementation of jq
	go install github.com/itchyny/gojq@latest
	go install github.com/davecheney/httpstat@latest
	go install github.com/MichaelMure/mdr@latest
	# Yet another Go implementation of jo
	go install github.com/itchyny/gojo/cmd/gojo@latest
	go install github.com/liamg/extrude/cmd/extrude@latest
	go install github.com/liamg/scout/cmd/scout@latest
	go install github.com/liamg/gifwrap/cmd/gifwrap@latest
	go install github.com/aquasecurity/tfsec/cmd/tfsec@latest
	go install github.com/aquasecurity/tfsec/cmd/tfsec-skeleton@latest
	go install github.com/aquasecurity/tfsec/cmd/tfsec-pr-lint@latest
	go install github.com/aquasecurity/tfsec/cmd/tfsec-docs@latest
	go install github.com/aquasecurity/tfsec/cmd/tfsec-checkgen@latest
	go install github.com/aquasecurity/trivy/cmd/trivy@latest
	go install github.com/acarl005/ls-go@latest
	go install github.com/jaytaylor/html2text/cmd/html2text@latest

	# simple terminal UI for git commands
	go install github.com/jesseduffield/lazygit@latest

	# Mackerel graph viewer in terminal
	go install github.com/itchyny/mkrg/cmd/mkrg@latest

	# 给IP加上地理信息的命令行小工具
	# go install github.com/imxieke/nali-go@latest
	go install github.com/Mikubill/nali-go@latest
	go install github.com/zu1k/nali@latest

	# A Docker manager for the terminal
	go install github.com/moncho/dry@latest
	# Base58 encoding/decoding package and command written in Go
	go install github.com/itchyny/base58-go/cmd/base58@latest
	# Binary editor written in Go
	go install github.com/itchyny/bed/cmd/bed@latest
	# 🐶 Command-line DNS Client for Humans. Written in Golang
	go install github.com/mr-karan/doggo/cmd/doggo@latest
	go install github.com/itchyny/maze/cmd/maze@latest
	if [[ "$(uname -s)" == 'Linux' ]]; then
		go install github.com/liamg/traitor/cmd/traitor@latest
	fi
}