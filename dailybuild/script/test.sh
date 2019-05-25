#!/bin/bash

#upload to pgyer
cd ~/CODE/git/zeronerhealthPro
LOG_COMMIT=`git log -1 | awk 'NR==5'`
echo ${LOG_COMMIT}

curl -F "file=@/Users/scow/CODE/git/zeronerhealthPro/dailybuild/ZeronerHealthPro.ipa" \
-F "uKey=6f9a5db5199f7da0bc2d0a30c0895d54" \
-F "_api_key=3929e4e4d1f82b9d06bed3d1c512cc48" \
-F "updateDescription=${LOG_COMMIT}" \
https://www.pgyer.com/apiv1/app/upload
