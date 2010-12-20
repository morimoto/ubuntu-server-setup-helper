#! /bin/sh
#===============================
#
# tools
#
#===============================
. ${TOP}/server-setting

PKG=minicom
TMP=`dpkg -l | grep ${PKG}`
if [ "x" = "x${TMP}" ]; then
    echo "	install minicom"
    apt-get install minicom
fi

sed -e "s|HOST_ADDR|${HOST_ADDR}|g" ${TOP}/${UBUNTU}/__start_bsp > ${TOP}/${UBUNTU}/start_bsp
chmod +x ${TOP}/${UBUNTU}/start_bsp
