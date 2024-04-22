#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:24:49
# @LastEditTime: 2024-04-22 17:17:20
# @LastEditors: Cloudflying
# @Description: Node Init
###

_install() {
    # Fabulously kill processes. Cross-platform
    npm i -g pnpm
    pnpm add -g bower yarn
    # Pack
    pnpm add -g grunt gulp-cli webpack webpack-cli rollup esbuild parcel vite
    pnpm add -g fkill-cli
    pnpm add -g fx
    pnpm add -g nali-cli
    pnpm add -g tldr @electron/asar apidoc

    # bug scanner
    # pnpm add -g snyk@latest

    pnpm add -g prettier

    pnpm add -g neovim

    # intelephense php autocomplete PHP language server
    pnpm add -g intelephense bash-language-server typescript-language-server yaml-language-server-parser

    # Language
    pnpm add -g @prettier/plugin-ruby prettier-plugin-sh prettier-plugin-sql prettier-plugin-java prettier-plugin-solidity \
        prettier-plugin-kotlin @prettier/plugin-php

    # Frontend
    pnpm add -g prettier-plugin-wxml @shufo/prettier-plugin-blade

    # Lint
    pnpm add -g dockerfile_lint dockerlint dockerfilelint

    # Conf
    pnpm add -g prettier-plugin-nginx

    # Documents
    pnpm add -g prettier-plugin-latex

    # Salesforce Apex
    pnpm add -g prettier-plugin-apex

    # Other
    pnpm add -g prettier-plugin-ssh-config prettier-plugin-ini prettier-plugin-pkg prettier-plugin-toml @prettier/plugin-xml

    # 用不到
    # @shopify/prettier-plugin-liquid prettier-plugin-go-template eslint-plugin-prettier-vue prettier-plugin-tvmsolidity @prettier/plugin-pug
    pnpm add -g eslint eslint-plugin-jsonc eslint-plugin-json

    # Lint
    pnpm add -g sql-lint
    pnpm add -g jsonlint

    pnpm add -g npm-run-all
}

_install
