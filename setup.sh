#! /bin/sh
#===============================
#
# setup
#
#===============================
export TOP=`pwd`
export HELPER=ubuntu-server-setup-helper
export HELPER_VER=0.3

#===============================
# check ubuntu PC
#===============================
if [ ! -f /etc/lsb-release ]; then
    echo "=================================="
    echo
    echo "      un-known Linux"
    echo
    echo " Your PC seems not ubuntu Linux"
    echo " This setup helper support ubuntu only"
    echo "=================================="
    exit 1
fi
. /etc/lsb-release

#===============================
# check ubuntu
#===============================
export UBUNTU=ubuntu-${DISTRIB_RELEASE}

if [ ! -d ${TOP}/${UBUNTU} ]; then
    echo "=================================="
    echo
    echo "      un-supported ubuntu"
    echo
    echo "You can not use this setup.sh on your machine"
    echo "This setup helper support..."
    echo
    ls -d ubuntu-*
    echo "=================================="

    exit 1
fi
. ${TOP}/${UBUNTU}/setting

#===============================
# check server-setting file
#===============================
if [ ! -f ${TOP}/server-setting ]; then
    echo "=================================="
    echo "     server-setting is not set"
    echo
    echo "You don't have server-setting file"
    echo "read README"
    echo "=================================="
    exit 1
fi

echo "=================================="
echo " Your Linux is ${DISTRIB_DESCRIPTION}"
echo "=================================="
echo

${TOP}/script/check-settings.sh | tee ${TOP}/${UBUNTU}/setting.log
[ $? -eq 1 ] && exit 1

#===============================
# install all
#===============================
for l in ${INS_LIST}
do
    echo "=================================="
    echo " Set up ${l}"
    echo "=================================="
    echo
    ${TOP}/ubuntu-setting/setup-${l}.sh | tee ${TOP}/${UBUNTU}/${l}.log
    [ $? -eq 1 ] && exit 1
done

echo "You can see this info at ./${UBUNTU}/comment.log"
