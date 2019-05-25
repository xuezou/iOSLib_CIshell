#/bin/bash

FRAMEWORK_PATH=/Users/scow/CODE/git/IVUIKit/Products/IVUIKit.framework
TO_PATH=/Users/scow/GitHub/IVUIKit/IVUIKit/IVUIKit.framework

cd ${FRAMEWORK_PATH}
echo `pwd`
cp -R ./* ${TO_PATH}

echo ${TO_PATH}
