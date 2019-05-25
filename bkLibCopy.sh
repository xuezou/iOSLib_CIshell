#/bin/bash

FRAMEWORK_PATH=/Users/scow/CODE/git/IVBaseKit/Products/IVBaseKit.framework
TO_PATH=/Users/scow/GitHub/IVBaseKit/IVBaseKit/IVBaseKit.framework

cd ${FRAMEWORK_PATH}
echo `pwd`
cp -R ./* ${TO_PATH}

echo ${TO_PATH}
