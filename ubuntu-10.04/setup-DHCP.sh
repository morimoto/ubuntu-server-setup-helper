#! /bin/sh
#===============================
#
# DHCP setup
#
#===============================

. ${TOP}/server-setting
. ${TOP}/${UBUNTU}/setting

SRV=dhcp3-server
FILE=${DHCP_FILE}
MYCONF=${TOP}/${UBUNTU}/my.dhcpd.conf

TMP=`dpkg -l | grep ${SRV}`

#===============================
# check TFTP server
#===============================
if [ ! -f /etc/default/tftpd-hpa ]; then
    echo
    echo "	install TFTP first"
    echo
    exit 1
fi

. /etc/default/tftpd-hpa

#===============================
# check server
#===============================
if [ "x" != "x${TMP}" ]; then
    echo
    echo "	Your ubuntu PC already have ${SRV}"
    echo "	So this script can not setup it"
    echo
    echo "	Check \"${FILE}\""
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

#===============================
# server setup
#===============================
echo "	setup server"

TMP=/tmp/myconf.$$
cp ${MYCONF} ${TMP}

echo                                                  >> ${FILE}
echo "# below is added by ${HELPER} : ${HELPER_VER}"  >> ${FILE}

sed -e "s|LOCAL_NET|${LOCAL_NET}|g"		${TMP} |\
sed -e "s|HOST_ADDR|${HOST_ADDR}|g"		|\
sed -e "s|DHCP_START|${DHCP_START}|g"		|\
sed -e "s|DHCP_END|${DHCP_END}|g"		|\
sed -e "s|NFS_FILE|${NFS_FILE}|g"		|\
sed -e "s|TFTP_FILE|${TFTP_FILE}|g"		|\
sed -e "s|TFTP_DIRECTORY|${TFTP_DIRECTORY}|g" >> ${FILE}
