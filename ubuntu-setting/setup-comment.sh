#! /bin/sh
#===============================
#
# finish
#
#===============================
. ${TOP}/${UBUNTU}/setting
. ${TFTP_FILE}

echo "==============================================="
echo
echo " BSP helper finished setup"
echo " But you should modify below files by yourself"
echo

sed -e "s|LOCAL_NET|${LOCAL_NET}|g"		${TOP}/ubuntu-setting/INSTALL_BSP |\
sed -e "s|HOST_ADDR|${HOST_ADDR}|g"		|\
sed -e "s|TFTP_DIRECTORY|${TFTP_DIRECTORY}|g"	|\
sed -e "s|NFS_FILE|${NFS_FILE}|g"		|\
sed -e "s|TFTP_FILE|${TFTP_FILE}|g"		|\
sed -e "s|DHCP_FILE|${DHCP_FILE}|g"		|\
sed -e "s|TOP|${TOP}|g"				|\
sed -e "s|UBUNTU|${UBUNTU}|g"

echo "==============================================="
