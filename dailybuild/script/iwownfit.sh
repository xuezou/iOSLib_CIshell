#!/bin/sh

CODEPATH=/Users/scow/CODE/git/iwownfit_5.0

cd ${CODEPATH}
git checkout
git stash 
git pull
#git push 
pod install
#pod update --no-repo-update
rm -rf ./dailybuild/iwownfitpro.ipa
LOG_MARK=`git log -1 | awk 'NR=1 {print substr($2,0,7)}'` 
LAST_LOG_MARK=`cat ~/shellScript/dailybuild/script/iwownfit/gitlogmark`
echo ${LOG_MARK}
echo ${LAST_LOG_MARK}

if [ LOG_MARK = LAST_LOG_MARK ]; then
	echo -e "exit with no update"
	exit 1
fi
echo ${LOG_MARK} > ~/shellScript/dailybuild/script/iwownfit/gitlogmark

xcodebuild archive -workspace ZeronerHealthPro.xcworkspace -scheme iWOWNfit\ Pro  -configuration Release -archivePath ${CODEPATH}/dailybuild/iwownfit_5.0

xcodebuild -exportArchive -archivePath ${CODEPATH}/dailybuild/iwownfit_5.0.xcarchive -exportPath ${CODEPATH}/dailybuild -exportOptionsPlist ${CODEPATH}/dailybuild/archive.plist




