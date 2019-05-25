#!/bin/sh

CODEPATH=/Users/scow/CODE/git/zeronerhealthPro

cd ${CODEPATH}
git checkout
git stash 
git pull
git submodule update
#git push 
/usr/local/bin/pod install --repo-update
#pod update --no-repo-update
rm -rf ./dailybuild/zeronerhealthpro.ipa
LOG_MARK=`git log -1 | awk 'NR=1 {print substr($2,0,7)}'` 
LAST_LOG_MARK=`cat ~/shellScript/dailybuild/script/zeronerhealth/gitlogmark`
echo ${LOG_MARK}
echo ${LAST_LOG_MARK}

if [ LOG_MARK = LAST_LOG_MARK ]; then
	echo -e "exit with no update"
	exit 1
fi
echo ${LOG_MARK} > ~/shellScript/dailybuild/script/zeronerhealth/gitlogmark

xcodebuild archive -workspace Kawayi.xcworkspace -scheme ZeronerHealth -configuration Release -archivePath ${CODEPATH}/dailybuild/zeronerhealthpro

xcodebuild -exportArchive -archivePath ${CODEPATH}/dailybuild/zeronerhealthpro.xcarchive -exportPath ${CODEPATH}/dailybuild -exportOptionsPlist ${CODEPATH}/dailybuild/ExportOptions.plist

#upload to pgyer
LOG_COMMIT=`git log -1 | awk 'NR==5'`
echo ${LOG_COMMIT}

curl -F "file=@/Users/scow/CODE/git/zeronerhealthPro/dailybuild/ZeronerHealthPro.ipa" \
-F "uKey=6f9a5db5199f7da0bc2d0a30c0895d54" \
-F "_api_key=3929e4e4d1f82b9d06bed3d1c512cc48" \
-F "updateDescription=${LOG_COMMIT}" \
https://www.pgyer.com/apiv1/app/upload


