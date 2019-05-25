#/bin/bash

#Verify variable is provided
if [ "$1" = "" ]; then
        echo -e "Version number not provide"
        exit 1
fi

GIT_REPO_PATH=/Users/scow/CODE/git/iOS-Utility/
FRAMEWORK_PATH=/Users/scow/CODE/git/iOS-Utility/ArchiveLib/
SEND_MAIL=/Users/scow/shellScript/Send_Mail/

cd ${GIT_REPO_PATH}
echo `pwd`
git checkout .
git pull

cd ${FRAMEWORK_PATH}
echo `pwd`
xcodebuild -target ArchiveSdk

VERSION_NUM=$1
LIB_NAME=IVScaleArchive${VERSION_NUM}_lib.zip
rm -rf ${LIB_NAME}
zip -r ${LIB_NAME} Products


cp ${LIB_NAME} ${SEND_MAIL}
ls -l ${SEND_MAIL} 

cd /Users/scow/shellScript/applescript/
./scaleAscp.sh 

rm -rf ${SEND_MAIL}/*
