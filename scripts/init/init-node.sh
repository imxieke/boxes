#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:24:49
# @LastEditTime: 2023-12-08 00:34:41
# @LastEditors: Cloudflying
# @Description:
###

_install() {
    # Fabulously kill processes. Cross-platform
    npm install -g bower yarn grunt gulp webpack webpack-cli rollup
    npm install -g fkill-cli
    npm install -g fx
    npm install -g nali-cli
    npm install -g tldr asar apidoc

    # bug scanner
    # npm install -g snyk@latest

    npm i -g prettier

    npm i -g neovim

    # intelephense php autocomplete PHP language server
    npm i -g intelephense bash-language-server typescript-language-server yaml-language-server-parser

    # Language
    npm i -g @prettier/plugin-ruby prettier-plugin-sh prettier-plugin-sql prettier-plugin-java prettier-plugin-solidity \
        prettier-plugin-kotlin @prettier/plugin-php

    # Frontend
    npm i -g prettier-plugin-wxml prettier-plugin-tailwind prettier-plugin-tailwindcss prettier-plugin-tailwind-css @shufo/prettier-plugin-blade

    # Lint
    npm install -g dockerfile_lint dockerlint dockerfilelint

    # Conf
    npm i -g prettier-plugin-nginx

    # Documents
    npm i -g prettier-plugin-latex

    # Salesforce Apex
    npm i -g prettier-plugin-apex

    # Other
    npm i -g prettier-plugin-ssh-config prettier-plugin-ini prettier-plugin-pkg prettier-plugin-toml @prettier/plugin-xml

    # 用不到
    # @shopify/prettier-plugin-liquid prettier-plugin-go-template eslint-plugin-prettier-vue prettier-plugin-tvmsolidity @prettier/plugin-pug
    npm i -g eslint eslint-plugin-jsonc eslint-plugin-json

    # Lint
    npm i -g sql-lint
    npm i -g jsonlint

    npm i -g npm-run-all
}
