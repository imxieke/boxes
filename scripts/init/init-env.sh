#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-09-17 20:30:35
# @LastEditTime: 2024-05-08 21:08:34
# @LastEditors: Cloudflying
# @Description: 初始化系统环境
###

# 使用个人配置文件初始化系统环境 符合个人使用习惯
init_env() {
  # Setup oh-my-zsh theme and plugin
  if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "==> Fetch oh my zsh"
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    echo "==> create .zshrc config file"
    ln -sf ${BOXS_HOME}/conf/.zshrc ~/.zshrc
  else
    git -C ~/.oh-my-zsh pull
  fi

  # zsh plugin manager
  if [[ -d ~/.oh-my-zsh ]] && [[ ! -d ~/.local/share/zinit/zinit ]]; then
    echo "==> zinit configuration"
    git clone --depth 1 https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit
  fi

  # Set Git Config
  if [[ -n "$(command -v git)" ]]; then
    echo "==> Git configuration"
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only --features=interactive'
    git config --global core.fileMode false
    git config --global core.ignorecase false
  fi

  # NeoCode
  if [[ -n "$(command -v nvim)" ]] && [[ ! -d ~/.config/nvim ]]; then
    echo "==> Fetch Packer Nvim Plugin Manager"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo "==> Fetch NeoCode configuration"
    git clone --depth 1 https://github.com/imxieke/NeoCode.git ~/.config/nvim
  fi

  # Composer
  # Offcial
  # https://repo.packagist.org
  # https://mirrors.cloud.tencent.com/composer/
  # https://mirrors.aliyun.com/composer/
  if [[ -n "$(command -v composer)" ]]; then
    wget -c --no-check-certificate https://mirrors.cloud.tencent.com/composer/composer.phar -O ~/.bin/composer
  fi

  echo "==> Set Composer Mirrors"
  composer config -g repos.packagist composer https://mirrors.cloud.tencent.com/composer/

  if [[ -z "$(command -v nvm)" ]]; then
    git clone --depth 1 https://github.com/nvm-sh/nvm.git ~/.local/share/nvm
  fi

  # Python pip
  # Offcial
  # https://pypi.org/simple/
  # https://mirrors.bfsu.edu.cn/pypi/
  # https://pypi.tuna.tsinghua.edu.cn/simple
  # http://mirrors.cloud.tencent.com/pypi/simple/
  # https://mirrors.aliyun.com/pypi/simple/
  if [[ -n "$(command -v pip)" ]]; then
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    pip config set install.trusted-host pypi.tuna.tsinghua.edu.cn
  fi

  if [[ -n "$(command -v pip2)" ]]; then
    pip2 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    pip2 config set install.trusted-host pypi.tuna.tsinghua.edu.cn
  fi

  if [[ -n "$(command -v pip3)" ]]; then
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    pip3 config set install.trusted-host pypi.tuna.tsinghua.edu.cn
  fi

  # Offcial
  # https://registry.npmjs.org/
  # http://mirrors.cloud.tencent.com/npm/
  # https://registry.npmmirror.com/
  # https://r.cnpmjs.org
  # https://pkgs-npm.pkg.coding.net/mirrors/npm
  if [[ -n "$(command -v npm)" ]]; then
    npm config set registry http://mirrors.cloud.tencent.com/npm/
  fi

  # https://mirrors.aliyun.com/rubygems/
  # https://mirrors.tuna.tsinghua.edu.cn/rubygems/
  # https://pods.xie.ke/rubygems/
  # https://gems.ruby-china.com
  # https://mirrors.cloud.tencent.com/rubygems/
  # https://repo.huaweicloud.com/repository/rubygems/
  # https://mirrors.huaweicloud.com/repository/rubygems/
  # https://mirrors.ustc.edu.cn/rubygems/
  if [[ -n "$(command -v gem)" ]]; then
    gem sources --remove https://rubygems.org/
    gem sources --add https://mirrors.aliyun.com/rubygems/
    # bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
  fi
}

init_vscode() {
  # Archlinux
  if [[ -z "$(bash bin/vsc -v | grep 'not found')" ]]; then
    echo "Found VSCode $(bash bin/vsc -v | head -n 1)"
  else
    echo "Unknown VSCode"
    return
  fi

  # Install VSCode extension
  echo "Install Vscode extension"

  if [[ -f ${BOXS_HOME}/backup/vscode-extensions.txt ]]; then
    for ext in $(cat ${BOXS_HOME}/backup/vscode-extensions.txt); do
      if [[ -z "$(ls -l ~/.vscode/extensions | grep "$ext")" ]]; then
        bash bin/vsc --install-extension $ext
      fi
    done
  fi
}
