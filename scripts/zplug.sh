#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-06-30 21:38:41
 # @LastEditTime: 2024-05-08 20:37:27
 # @LastEditors: Cloudflying
 # @Description: load zsh plugins
###



zplug()
{
    case "$1" in
        load)
            __zplug_load $@
        ;;
        loads)
            __zplug_loads $@
        ;;
        theme)
            __zplug_load_themes $2
        ;;
        *) echo default
        ;;
    esac

    # echo $@
}

# Support Protocol
# http://
# https://
# git://
# git@github.com
# plugin:: load zsh addtion plugin
__zplug_parse_repo()
{
    ZSH_PLUGIN_REPO=$(echo "$2" | sed 's#\.git##g')
    if [[ -n "$( echo ${ZSH_PLUGIN_REPO} | grep -E 'plugin::' )" ]];then
        PLUGIN_NAME=$(echo ${ZSH_PLUGIN_REPO} | sed 's#plugin::##g' )
    elif [[ -n "$( echo ${ZSH_PLUGIN_REPO} | grep -E 'http://|https://|git://' )" ]];then
        PLUGIN_HOST=$(echo ${ZSH_PLUGIN_REPO} | awk -F '/' '{print $1"//"$2"/"$3}')
        PLUGIN_URI=$(echo ${ZSH_PLUGIN_REPO} | awk -F '/' '{print $4"/"$5}')
        PLUGIN_NAME=$(echo ${ZSH_PLUGIN_REPO} | awk -F '/' '{print $5}')
    elif [[ -n "$( echo ${ZSH_PLUGIN_REPO} | grep -E '@' )" ]];then
        PLUGIN_HOST=$(echo ${ZSH_PLUGIN_REPO} | awk -F ':' '{print $1}')
        PLUGIN_URI=$(echo ${ZSH_PLUGIN_REPO} | awk -F ':' '{print $2}' )
        PLUGIN_NAME=$(echo ${PLUGIN_URI} | awk -F '/' '{print $2}')
    elif [[ -n "$( echo ${ZSH_PLUGIN_REPO} | awk -F '/' '{print $2}' )" ]];then
        PLUGIN_URI=${ZSH_PLUGIN_REPO}
        PLUGIN_NAME=$(echo ${ZSH_PLUGIN_REPO} | awk -F '/' '{print $2}')
    fi
}

__zplug_loads()
{
    plugins=($(echo $2 | tr ',' '\n'))
    for plug in ${plugins[@]}
    do
        __zplug_load load "plugin::${plug}"
    done
}

__zplug_load()
{
    __zplug_parse_repo $@
    local ZSH_PLUGIN_DIR=${ZSH}/plugins/$PLUGIN_NAME
    local ZSH_PLUGIN_FILE=${ZSH}/plugins/$PLUGIN_NAME/${PLUGIN}.zsh
    ZSH_PLUGIN_FILE="${ZSH}/plugins/${PLUGIN_NAME}/${PLUGIN_NAME}.plugin.zsh"
    # echo ${ZSH_PLUGIN_FILE}
    if [[ -f "${ZSH_PLUGIN_FILE}" ]]; then
        echo "[+] Source " ${ZSH_PLUGIN_FILE}
        source ${ZSH_PLUGIN_FILE}
    elif [[ -d "${ZSH_PLUGIN_DIR}" ]];then
        echo "[+] Source " ${ZSH_PLUGIN_FILE}
        source ${ZSH_PLUGIN_DIR}/*.plugin.zsh
    else
        # echo ${PLUGIN_NAME}
        # echo ${ZSH_PLUGIN_FILE}
        # echo ${ZSH_PLUGIN_DIR}
        echo "Pull $2"
        __zplug_pull_plugin $2
    fi
}

__zplug_load_themes()
{
    __zplug_parse_repo $@
    local ZSH_THEME_DIR=${ZSH}/themes/$PLUGIN_NAME
    local ZSH_THEME_FILE="${ZSH}/plugins/${PLUGIN_NAME}/${PLUGIN_NAME}.zsh-theme"
    # echo ${ZSH_PLUGIN_FILE}
    if [[ -f "${ZSH_PLUGIN_FILE}" ]]; then
        echo "[+] Source " ${ZSH_PLUGIN_FILE}
        source ${ZSH_PLUGIN_FILE}
    elif [[ -d "${ZSH_PLUGIN_DIR}" ]];then
        echo "[+] Source " ${ZSH_PLUGIN_FILE}
        source ${ZSH_PLUGIN_DIR}/*.plugin.zsh
    else
        # echo ${PLUGIN_NAME}
        # echo ${ZSH_PLUGIN_FILE}
        # echo ${ZSH_PLUGIN_DIR}
        echo "Pull $2"
        __zplug_pull_plugin $2
    fi
}

#
__zplug_pull_plugin()
{
    __zplug_parse_repo $@
    # support http https git protocol
    if [[ -n "$(echo ${PLUGIN} | grep -E 'http://|https://|git://|@')" ]]; then
        git clone --depth 1 "https://github.com/${PLUGIN_URI}.git" ${ZSH}/plugins/$PLUGIN_NAME
    # default url is github
    else
        git clone --depth 1 "https://github.com/${PLUGIN_URI}.git" ${ZSH}/plugins/${PLUGIN_NAME}
    fi
}