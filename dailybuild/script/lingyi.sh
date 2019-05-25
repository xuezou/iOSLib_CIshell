#!/bin/sh

ENVIMENT_LINGYI=linyi_live
REPO_PATH=/Users/scow/CODE/git/week_build

cd ${REPO_PATH}
git checkout .
git pull
git submodule update
rm -rf ./dailybuild/linyi.ipa

cd ${REPO_PATH}
react-native bundle --entry-file index.ios.js --bundle-output ./ios/bundle/index.ios.jsbundle --platform ios --assets-dest ./ios/bundle --dev false

cd ${REPO_PATH}/ios
#sed -i -n 's/COCOAPODS: 1.2.1.beta.1/COCOAPODS: 1.2.1/' Podfile.lock
pod repo update
pod install
xcodebuild archive -workspace linyi.xcworkspace -scheme ${ENVIMENT_LINGYI} -configuration Release -archivePath ${REPO_PATH}/ios/dailybuild/ZLYIwown.xcarchive

xcodebuild -exportArchive -archivePath ${REPO_PATH}/ios/dailybuild/ZLYIwown.xcarchive -exportPath ${REPO_PATH}/ios/dailybuild -exportOptionsPlist ${REPO_PATH}/ios/dailybuild/archive_live.plist

