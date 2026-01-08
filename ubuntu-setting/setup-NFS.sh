#! /bin/sh
#===============================
#
# NFS setup
#
#===============================
. ${TOP}/server-setting
. ${TOP}/${UBUNTU}/setting

SRV=${NFSD}
TMP=`dpkg -l | grep ${SRV}`

#===============================
# check TFTP server
#===============================
if [ ! -f ${TFTP_FILE} ]; then
    echo
    echo "	install TFTP first"
    echo
    exit 1
fi

. ${TFTP_FILE}

FILE=${NFS_FILE}

#===============================
# check server
#===============================
if [ "x" != "x${TMP}" ]; then
    echo
    echo "	Your ubuntu PC already have ${SRV}"
    echo "	So this script can not setup it"
    echo
    echo "	Check \"${FILE}\" and add below by your self (if needed)"
    echo
    exit 0
fi

#===============================
# install server
#===============================
echo "	install ${SRV}"
apt-get install -y ${SRV}
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

echo                                                  >> ${FILE}
echo "# below is added by ${HELPER} : ${HELPER_VER}"  >> ${FILE}
echo "${TFTP_DIRECTORY}			${LOCAL_NET}/24(rw,sync,no_root_squash,no_subtree_check,fsid=0)"	>> ${FILE}
echo "${TFTP_DIRECTORY}/board0/rootfs	${LOCAL_NET}/24(rw,sync,no_root_squash,no_subtree_check)"		>> ${FILE}
echo "${TFTP_DIRECTORY}/board1/rootfs	${LOCAL_NET}/24(rw,sync,no_root_squash,no_subtree_check)"		>> ${FILE}
echo "${TFTP_DIRECTORY}/board2/rootfs	${LOCAL_NET}/24(rw,sync,no_root_squash,no_subtree_check)"		>> ${FILE}
