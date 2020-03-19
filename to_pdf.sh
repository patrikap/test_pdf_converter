#!/bin/bash
### DIRECTORIES
PROJECT_PATH=`pwd`
### WRITE LOG
RED='\033[0;31m'
GREEN='\033[0;32m'
NORMAL='\033[0m'
function log {
    DTM=`date  +%H:%M:%S`
    if [[ $2 -eq 0 ]];then
        echo -e "${DTM}\t${1}\t\t${GREEN}OK${NORMAL}"
    else
        echo -e "${DTM}\t${1}\t\t${RED}ERROR${NORMAL}" 1>&2
    fi
}
### CONVERT FUNCTION
function convert {
    if [[ -f "$1" ]] ; then
        FILE=$1
        a2ps ${FILE} --silent -g -o - | ps2pdf - ${FILE}.pdf
        log "Created a new .pdf file on path $FILE.pdf"
    else
        log "First parameter must be valid file ($FILE)" 1
    fi
}
### CHECK SRC
if [[ -d "$1" ]] ; then
    DATA_DIR="$1"
    log "Directory $DATA_DIR" $?
else
    log "First parameter 'src' must be valid directory on your filesystem." 1
    exit 1

fi
### RECURSIVE SEARCH
FILES=`find ${DATA_DIR} -type f -name '*.php' -o -name '*.html' -o -name '*.js'`
for FILE in ${FILES[*]}
do
    log "File found on path $FILE" $?
    convert ${FILE}
done
exit 0