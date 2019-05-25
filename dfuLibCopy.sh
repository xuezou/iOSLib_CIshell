#/bin/bash

BUNDLE_PATH=/Users/ASCE/CODE/git/DFUFramework/Products/DFUFramework.bundle
FRAMEWORK_PATH=/Users/ASCE/CODE/git/DFUFramework/Products/DFUFramework.framework
TO_PATH_F=/Users/ASCE/GitHub/IVFUpgrade/IVFUpgrade/DFUFramework.framework
TO_PATH_B=/Users/ASCE/GitHub/IVFUpgrade/IVFUpgrade/DFUFramework.bundle


cd ${FRAMEWORK_PATH}
echo `pwd`
cp -R ./* ${TO_PATH_F}

cp -R ${BUNDLE_PATH}/* ${TO_PATH_B}

echo ${TO_PATH_F}

