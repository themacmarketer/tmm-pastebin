#######################
-->> ABOUT
#######################
(*

 Phil Stokes -- 2018
 applehelpwriter.com
 sqwarq.com

*)
#######################
-->> DESCRIPTION
#######################
(*

Remove whitespace
in BBEDit's front document

*)
#######################
-->> USAGE
#######################
(*

Save the script in BBEdit's Script folder, then run it on the front document by choosing
it from the Script menu in BBEdit's menu bar.

*)
#######################
-->> IMPORT STATEMENTS
#######################

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
use framework "Foundation"

#  classes, constants, and enums used
property NSCharacterSet : a reference to current application's NSCharacterSet
property NSString : a reference to current application's NSString

#######################
-->> HANDLERS
#######################

on removeWhitespaceInText:srcText
	set stringList to {}
	set returnStr to ""
	set lineList to paragraphs of srcText
	repeat with aLine in lineList
		set aString to (NSString's stringWithString:aLine)
		set remainingString to (aString's stringByTrimmingCharactersInSet:(NSCharacterSet's whitespaceAndNewlineCharacterSet()))
		set applescriptStr to remainingString as text
		if applescriptStr's length is greater than 0 then
			set end of stringList to remainingString
		end if
	end repeat
	repeat with str in stringList
		set returnStr to returnStr & (str as text) & return
	end repeat
	set returnStr to text 1 thru -2 of returnStr
	return returnStr
end removeWhitespaceInText:

#######################
-->> COMMANDS
#######################

tell application "BBEdit"
	set t to text of front document
	set t to my removeWhitespaceInText:t
	set text of front document to t
end tell
#######################
#EOF
