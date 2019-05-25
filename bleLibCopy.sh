#/bin/bash

BLEFRAMEWORK_PATH=/Users/scow/CODE/git/SDK_CODE/Products/BLEMidAutumn.framework
TO_PATH=/Users/scow/CODE/git/libIWownBLEIOS/Products/BLEMidAutumn.framework

rm -rf ${TO_PATH}/*
cd ${BLEFRAMEWORK_PATH}
echo `pwd`
cp -R ${BLEFRAMEWORK_PATH}/* ${TO_PATH}

echo ${TO_PATH}
