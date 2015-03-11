#! /bin/sh
#===============================
#
# patch
#
# 2015/03/11 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
#===============================

. ${TOP}/${UBUNTU}/setting

#===============================
# backup all
#===============================
for f in ${BK_ORIG}
do
    ${TOP}/script/file-backup.sh ${f}
done

#===============================
# patch all
#===============================
cd /
for p in ${PATCH}
do
    patch -p1 < ${TOP}/${UBUNTU}/${p}
done
