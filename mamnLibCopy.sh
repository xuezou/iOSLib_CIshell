#/bin/bash

BLEFRAMEWORK_PATH=/Users/scow/CODE/git/BLEMidAutumn/Products/BLEDragonBoat.framework
TO_PATH=/Users/scow/GitHub/BLEMidAutumn/BLEDragonBoat/BLEDragonBoat.framework

rm -rf ${TO_PATH}/*
cd ${BLEFRAMEWORK_PATH}
echo `pwd`
cp -R ${BLEFRAMEWORK_PATH}/* ${TO_PATH}/

echo ${TO_PATH}
