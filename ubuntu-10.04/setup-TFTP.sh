#! /bin/sh
#===============================
#
# TFTP setup
#
#===============================
. ${TOP}/server-setting
. ${TOP}/${UBUNTU}/setting

SRV=tftpd-hpa
FILE=${TFTP_FILE}

TMP=`dpkg -l | grep ${SRV}`

#===============================
# check server
#===============================
if [ "x" != "x${TMP}" ]; then
    echo
    echo "	Your ubuntu PC already have ${SRV}"
    echo
    exit 0
fi

#===============================
# install server
#===============================
echo "	install ${SRV}"
apt-get install ${SRV}
if [ $? -ne 0 ]; then
    echo "	install ${SRV} failed"
    exit 1
fi

#===============================
# file backup
#===============================
echo "	backup original setting file (${FILE})"
${TOP}/script/file-backup.sh ${FILE}
