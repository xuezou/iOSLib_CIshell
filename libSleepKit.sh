#/bin/bash

#Verify variable is provided
if [ "$1" = "" ]; then
        echo -e "Version number not provide"
        exit 1
fi

GIT_REPO_PATH=/Users/scow/CODE/git/staticLib/
FRAMEWORK_PATH=/Users/scow/CODE/git/staticLib/SleepLib/IVSleep/IVSleep/
TO_PATH_A=/Users/scow/CODE/git/staticLib/SleepLib/IVSleep/IVSleep_lib 
TO_PATH_B=/Users/scow/CODE/git/staticLib/SleepLib/IVSleep/IVSleep_lib/TestSleep/TestSleep/
SEND_MAIL=/Users/scow/shellScript/Send_Mail/

cd ${GIT_REPO_PATH}
git checkout .
git pull

cd ${FRAMEWORK_PATH}
echo `pwd`
xcodebuild -target SleepLib
cp -R ./Products/ ${TO_PATH_A}
cp -R ./Products/ ${TO_PATH_B}


VERSION_NUM=$1
LIB_NAME=IVSleep_lib${VERSION_NUM}.zip

cd ..
rm -rf ${LIB_NAME}
zip -r ${LIB_NAME} IVSleep_lib


cp ${LIB_NAME} ${SEND_MAIL}
ls -l ${SEND_MAIL} 

cd /Users/scow/shellScript/applescript/
./sleepAscp.sh 

rm -rf ${SEND_MAIL}/*
