#!/bin/bash

cd /Users/scow/CODE/git/
zip -qro devcenter.zip devcenter_amazon
scp ./devcenter.zip  scow@api6.iwown.com:/usr/local/nginx_ssl/html/
rm -rf devcenter.zip 
ssh scow@api6.iwown.com "cd /usr/local/nginx_ssl/html/; rm -rf devcenter; unzip -o devcenter.zip; mv ./devcenter_amazon ./devcenter" 
