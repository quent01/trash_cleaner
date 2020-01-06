#!/bin/bash
#
# trash_cleaner.sh
#

# VARIABLES
# ----------------------------------
PATH_TO_CLEAN="/var/www/"
TRASHES[0]="*.tar.gz"
TRASHES[1]="*.zip"
TRASHES[2]="*.sql"
TRASHES[3]="*.sql.*"
TRASHES[4]="adminer.php"
TRASHES[5]="dploy.yaml"

C_RED='\033[0;31m'
C_YELLOW='\033[1;33m'
C_NC='\033[0m'              # No Color
C_GREEN='\033[0;32m'
C_BRN='\033[0;33m'
C_BLUE='\033[0;34m'
C_MAGENTA='\033[0;35m'
C_CYAN='\033[0;36m'
C_WHITE='\033[0;97m'



# FUNCTIONS
# ----------------------------------
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

    function help(){
        alert_info "$(basename "$0") [-h] [-p path/to/folder]";
        alert_info "-- program to display useless trash file (we search 2 level tree)";
        alert_info "where:";
        alert_info "-h  show this help text";
        alert_info "-p  set the path value (default: ${PATH_TO_CLEAN})";
    }


# SCRIPT
# ----------------------------------
while getopts ':hp:' option; do
    case "${option}" in
        h)  help
            exit
            ;;
        p)  PATH_TO_CLEAN=${OPTARG}
            ;;
        \?) printf "${C_RED}Illegal option: -%s\n${C_RED}" "$OPTARG" >&2
            help >&2
            exit 1
            ;;
    esac
done

if [ -d $PATH_TO_CLEAN ]; then
    alert_info "The path ${PATH_TO_CLEAN} will be cleaned"
    for trash in "${TRASHES[@]}"; do
        find $PATH_TO_CLEAN -maxdepth 2 -type f -name "${trash}"
    done
else
    alert_warning "The path ${PATH_TO_CLEAN} does not exist"
fi
