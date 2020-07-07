#!/bin/bash
#
# settings.default.sh
# copy and change this file in settings.sh
#

PATH_TO_CLEAN="/var/www/"
TRASHES[0]="*.tar."
TRASHES[1]="*.tar.*"
TRASHES[2]="*.zip"
TRASHES[3]="*.sql"
TRASHES[4]="*.sql.*"
TRASHES[5]=".phar"
TRASHES[6]="adminer.php"
TRASHES[7]="dploy.yaml"
TRASHES[8]="srdb.cli.php"
TRASHES[9]="bigdump.php"
TRASHES[10]="backdoor.php"

MAIL_SUBJECT="Trash cleaner"
MAIL_NOTIFICATION="tech@tiz.fr"