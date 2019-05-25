

BLEFRAMEWORK_PATH=/Users/scow/CODE/git/BLEMidAutumn/BLEProtocBuff/Products/BLEProtoBuf.framework
TO_PATH=/Users/scow/GitHub/BLEProtoBuf/BLEProtoBuf/

rm -rf ${TO_PATH}/*
cd ${BLEFRAMEWORK_PATH}
echo `pwd`
cp -R ${BLEFRAMEWORK_PATH} ${TO_PATH}

echo ${TO_PATH}
