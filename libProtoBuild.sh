#!/bin/bash

#Verify variable is provided
if [ "$1" = "" ]; then
        echo -e "Version number not provide"
        exit 1
fi

#Compare version code  
VERSION=$1
LAST_VERSION_CODE=`cat /Users/scow/shellScript/LastVersion/ProtoKitCode`

a=${VERSION//./}
b=${LAST_VERSION_CODE//./}

echo -e "New Version Code is ${a}"
echo -e "Last Version Code is ${b}"

if [ "$a" -le "$b" ]; then
        echo -e "Version code must be greater than ${LAST_VERSION_CODE}"
        exit 1
fi

#Save new version code in file
echo ${VERSION} > /Users/scow/shellScript/LastVersion/ProtoKitCode 

#PATH veriable
PATH_SDK_CODE=/Users/scow/CODE/git/BLEMidAutumn/
PATH_DESKTOP=/Users/scow/shellScript/
PATH_GITHUB_REPO=/Users/scow/GitHub/BLEProtoBuf/

#build sdk
cd ${PATH_SDK_CODE}
echo `pwd`
git reset --hard HEAD
git pull

#lib file copy to repo
cd ${PATH_DESKTOP}
echo `pwd`
${PATH_DESKTOP}ProtoLibCopy.sh

if [ "$2" = "0" ]; then
        echo -e "exit without pod"
        exit 1
fi

#push to github and release in CocoaPods
cd ${PATH_GITHUB_REPO}
echo `pwd`
${PATH_GITHUB_REPO}podTrunk.sh ${VERSION}

