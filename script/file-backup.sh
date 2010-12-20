#! /bin/sh
#===============================
#
# file backup
#
#===============================
FILE=`basename $1`
DIR=`dirname $1`
DATE=`date +%Y%m%d%H%M`

cp ${DIR}/${FILE} ${DIR}/${FILE}-${DATE}
