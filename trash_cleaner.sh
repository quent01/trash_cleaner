#!/bin/bash
#
# trash_cleaner.sh
#
source "vendors/alerts.sh"

if [ -f "config/settings.sh" ]; then
    source "config/settings.sh"
else
    alert_error "You must copy config/settings.default.sh in config/settings.sh and change variables"
    exit
fi

# variables
MAIL_TXT="mail.txt"

#  File exist and as a size greater than 0
if [ -s $MAIL_TXT ]; then
    rm $MAIL_TXT
fi




# FUNCTIONS
# ----------------------------------

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
        find $PATH_TO_CLEAN -maxdepth 3 -type f -name "${trash}" >> $MAIL_TXT
    done

    if [ -x "$(command -v mail)" ]; then
        mail -s "${MAIL_SUBJECT}" $MAIL_NOTIFICATION <<< $MAIL_TXT
    else
        alert_error "Mail with result could not be send because mailutils is not installed"
    fi

else
    alert_warning "The path ${PATH_TO_CLEAN} does not exist"
fi
