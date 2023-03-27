#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2021-12-05 17:58:03
 # @LastEditTime: 2023-03-27 21:27:26
 # @LastEditors: Cloudflying
 # @Description: 有颜色的文字 TODO
### 

# Resources:
# * http://en.wikipedia.org/wiki/8-bit_color
# * http://en.wikipedia.org/wiki/ANSI_escape_code
# * /usr/share/X11/rgb.txt

# echo -e "\033[0mCOLOR_NC (No color)"
# echo -e "\033[0;30mCOLOR_BLACK\t\t\033[0;90mCOLOR_GREY"
# echo -e "\033[0;31mCOLOR_RED\t\t\033[0;91mCOLOR_LIGHT_RED"
# echo -e "\033[0;32mCOLOR_GREEN\t\t\033[0;92mCOLOR_LIGHT_GREEN"
# echo -e "\033[0;33mCOLOR_YELLOW\t\t\033[0;93mCOLOR_LIGHT_YELLOW"
# echo -e "\033[0;34mCOLOR_BLUE\t\t\033[0;94mCOLOR_LIGHT_BLUE"
# echo -e "\033[0;35mCOLOR_MAGENTA\t\t\033[0;95mCOLOR_LIGHT_MAGENTA"
# echo -e "\033[0;36mCOLOR_CYAN\t\t\033[0;96mCOLOR_LIGHT_CYAN"
# echo -e "\033[0;37mCOLOR_LIGHT_GREY\t\033[0;97mCOLOR_LIGHT_WHITE"

# echo -e "\033[0;31mCOLOR_RED"

_red() {
    printf '\033[1;31;31m%b\033[0m' "$1"
}

_green() {
    printf '\033[1;31;32m%b\033[0m' "$1"
}

_yellow() {
    printf '\033[1;31;33m%b\033[0m' "$1"
}

_info() {
    _green "[Info] "
    printf -- "%s" "$1"
    printf "\n"
}

_warn() {
    _yellow "[Warning] "
    printf -- "%s" "$1"
    printf "\n"
}

_error() {
    _red "[Error] "
    printf -- "%s" "$1"
    printf "\n"
    exit 1
}

function color() {
  local color=$1 style=$2 b=0

  shift

  case $style in
    bold|b)           b=1; shift ;;
    italic|i)         b=2; shift ;;
    underline|u)      b=4; shift ;;
    inverse|in)       b=7; shift ;;
    strikethrough|s)  b=9; shift ;;
  esac

  case $color in
    black|b)    echo -e "\033[${b};30m${@}\033[0;m" ;;
    red|r)      echo -e  "\033[${b};31m${@}\033[0;m" ;;
    green|g)    echo -e "\033[${b};32m${@}\033[0;m" ;;
    yellow|y)   echo -e "\033[${b};33m${@}\033[0;m" ;;
    blue|bl)    echo -e "\033[${b};34m${@}\033[0;m" ;;
    magenta|m)  echo -e "\033[${b};35m${@}\033[0;m" ;;
    cyan|c)     echo -e "\033[${b};36m${@}\033[0;m" ;;
    white|w)    echo -e "\033[${b};37m${@}\033[0;m" ;;
    *)          echo -e "\033[${b};38;5;$(( ${color} ))m${@}\033[0;m" ;;
  esac
}

color "$@"