#!/bin/bash

echo `pwd`
#osascript ./sleepLib.scpt
exec osascript <<EOF 
tell application "Finder"
	set folderPath to folder "scow:Users:scow:shellScript:Send_Mail:"
	set theFile to first file in folderPath as alias
	set fileName to name of theFile
	--set fileList to name of file 1 in folderPath
end tell


--Variables
set recipientName to "iwown market"
set recipientAddress to "chenwu@iwown.com"
set recipientNameM to "Weiwei Mao"
set recipientAddressM to "maowei@iwown.com"
set recipientNameH to "HuaShengda"
set recipientAddressH to "huanxinchen@hinteen.com"
set theSubject to "iOS Sleep algorithm lib for Watch"
set theContent to "This email means sleep lib had new version!"
set theAttachment to theFile
set theSender to "Leopard"

--Mail Tell Block
tell application "Mail"
	
	--Create the message
	set theMessage to make new outgoing message with properties {subject:theSubject, content:theContent, visible:true}
	
	--Set a recipient
	tell theMessage
		set visibile to true
		set sender to theSender
		make new to recipient at end of to recipients with properties {name:recipientName, address:recipientAddress}
		make new to recipient at end of to recipients with properties {name:recipientNameM, address:recipientAddressM}
		make new to recipient at end of to recipients with properties {name:recipientNameH, address:recipientAddressH}
		try
			make new attachment with properties {file name:theAttachment} at after the last word of the last paragraph
			set message_attachment to 0
		on error errmess -- oops
			log errmess -- log the error
			set message_attachment to 1
		end try
		log "message_attachment = " & message_attachment
		
		--Send the Message
		delay 5
		send
		
	end tell
end tell
EOF
