#!/bin/bash
#
# alerts.sh
#
C_RED='\033[0;31m'
C_YELLOW='\033[1;33m'
C_NC='\033[0m'              # No Color
C_GREEN='\033[0;32m'
C_BRN='\033[0;33m'
C_BLUE='\033[0;34m'
C_MAGENTA='\033[0;35m'
C_CYAN='\033[0;36m'
C_WHITE='\033[0;97m'


function alert() {
    level=$1
    msg=$2
    if [ $level == '--warning']; then 
        alert_warning $2
    elif [ $level == '--info' ]; then
        alert_info $2
    elif [ $level == '--success' ]; then
        alert_success $2
    elif [ $level == '--error' ]; then
        alert_error $2
    else
        alert_info $2
    fi
}
function alert_warning() {
    MSG=$1
    echo -e "${C_YELLOW} ${MSG} ${C_NC}"
}
function alert_error() {
    MSG=$1
    echo -e "${C_RED} ${MSG} ${C_NC}"
}

function alert_info() {
    MSG=$1
    echo -e "${C_BLUE} ${MSG} ${C_NC}"
}

function alert_success() {
    MSG=$1
    echo -e "${C_GREEN} ${MSG} ${C_NC}"
}