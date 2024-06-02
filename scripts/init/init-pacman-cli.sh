#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:13:06
# @LastEditTime: 2024-06-02 21:28:06
# @LastEditors: Cloudflying
# @Description: Manjaro 和 Archlinux 软件源不同 Manjaro 软件比较多
###

# manjaro contains all archlinux packages, but archlinux has many packages that do not exist
_install() {
  # Dev
  pacman -S --noconfirm base-devel cmake cppcheck gdb

  # Compress
  # GUI Archive: file-roller
  pacman -S --noconfirm bzip2 unzip unarchiver gzip tar p7zip unrar lzip lrzip xz zip zstd file-roller \
    squashfs-tools unace

  # Network
  # openbsd-netcat: nc command
  # corkscrew: tunneling SSH through HTTP proxies
  pacman -S --noconfirm net-tools mtr traceroute dnsutils iputils lsof \
    clash \
    rsync \
    whois \
    openbsd-netcat corkscrew socat \
    syncthing \
    iperf iperf3

  # Language
  pacman -S --noconfirm python python-pip go nodejs npm jdk-openjdk php
  pacman -S --noconfirm python-beautifulsoup4 python-cchardet python-chardet python-lxml python-html5lib

  # Program Package Manager
  pacman -S --noconfirm composer

  # File && Code Tools
  # rg A search tool that combines the usability of ag with the raw speed of grep
  # ag Code searching tool similar to Ack, but faster
  # # duf Disk Usage/Free Utility
  # ripgrep-all ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc.
  pacman -S --noconfirm ripgrep the_silver_searcher duf fzf ripgrep-all

  # Tools
  # flameshot screenshot
  # shutter screenshot
  # jp2a A small utility for converting JPG images to ASCII
  # d-feet D-Bus debugger for GNOME
  # asciinema Record and share terminal sessions
  # skim Fuzzy Finder in Rust
  # vokoscreen 录屏
  # syft generating a Software Bill of Materials from container images and filesystems
  # Disk usage analyzer with an ncurses interface
  # xsv A CLI for indexing, slicing, analyzing, splitting and joining CSV files
  # sysstat a collection of performance monitoring tools (iostat,isag,mpstat,pidstat,sadf,sar)
  # glow markdown preview
  pacman -S --noconfirm tree jq sudo file less zsh cowsay cowfortune btop htop lsb-release ntp mtools xsv exa \
    skim fd bat bat-extras syft ncdu \
    sysstat \
    glow

  # Package management
  # App Store
  # snapd yay not in Archlinux
  pacman -S --noconfirm dpkg pacman-mirrors

  # Media
  pacman -S --noconfirm ffmpeg

  # Documents
  pacman -S --noconfirm pandoc pandoc-plot

  # Security
  # osv-scanner Vulnerability scanner
  pacman -S --noconfirm nmap rustscan osv-scanner sqlmap masscan

  # Virtual Machine && Container
  # podman-docker conflict with docker
  # pacman -S --noconfirm docker docker-buildx docker-compose docker-scan \
  # podman podman-compose

  # Virtual Machine && Container Depency
  # pacman -S --noconfirm fuse-overlayfs

  # Docker Tools
  # ctop like linux top
  # crun replace runc, crun is faster than runc and has a much lower memory footprint.
  # podman --runtime /usr/bin/crun run --rm --memory 4M fedora echo it works
  # cosign sign container image
  # dive A tool for exploring each layer in a docker image
  # skopeo Work with remote images registries - retrieving information, images, signing content
  pacman -S --noconfirm ctop container-diff crun cosign dive skopeo

  # Git Tools
  # onefetch: like neofetch but for git
  # gitg GUI client to view git repositories.
  pacman -S --noconfirm git git-lfs github-cli git-delta onefetch gitg gitui

  # Blockchain
  # pacman -S --noconfirm go-ethereum openethereum

  # Downloader
  pacman -S --noconfirm axel wget curl aria2 youtube-dl

  # Editor
  pacman -S --noconfirm neovim

  # Format
  # shellcheck depends on haskell
  pacman -S --noconfirm shfmt
}

_install
