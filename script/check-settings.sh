#! /bin/sh
#===============================
#
# check setting
#
#===============================
. ${TOP}/server-setting

LN=`echo ${LOCAL_NET}  | cut -d'.' -f1-3`
HA=`echo ${HOST_ADDR}  | cut -d'.' -f1-3`

if [ x${LN} != x${HA} -o\
     x${LN} != x${DS} -o\
     x${LN} != x${DE} -o ]; then
    echo "********************************"
    echo "              ERROR"
    echo
    echo " check your server-setting file again !!"
    echo " your sub-network setting seems wrong !! "
    echo
    echo "LOCAL_NET  = ${LN}.0"
    echo "HOST_ADDR  = ${HA}.0"
    echo "********************************"
    exit 1
fi

exit 0
