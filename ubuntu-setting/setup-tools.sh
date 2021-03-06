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
    apt-get install -y minicom
fi

sed -e "s|HOST_ADDR|${HOST_ADDR}|g" ${TOP}/ubuntu-setting/__start_bsp > ${TOP}/${UBUNTU}/start_bsp
chmod +x ${TOP}/${UBUNTU}/start_bsp
cp ${TOP}/ubuntu-setting/stop_bsp ${TOP}/${UBUNTU}/
