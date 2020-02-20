#!/bin/bash
#
# settings.default.sh
# copy and change this file in settings.sh
#

PATH_TO_CLEAN="/var/www/"
TRASHES[0]="*.tar.gz"
TRASHES[1]="*.zip"
TRASHES[2]="*.sql"
TRASHES[3]="*.sql.*"
TRASHES[4]="adminer.php"
TRASHES[5]="dploy.yaml"

MAIL_SUBJECT="Trash cleaner"
MAIL_NOTIFICATION="tech@tiz.fr"