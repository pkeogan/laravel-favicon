#!/bin/bash
# Laravel-Favicon install script
###
# Config
###
faviconfolder="resources/assets/favicon"
faviconviewfolder="resources/views/vendor/laravel-favicon"
###
# Main body of script starts here
###

# Ask user for location to package
echo Where is the location of the favicon package? \(ensure you included htlm_code\)

#get the input
read ziplink

# Check inpput and seee if its a valid link, and also check that its a zip
#if it a bad link, then exit- if it is conintue
regex='(https|http)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]*[\.zip$]'
if [[ $ziplink =~ $regex ]]
then
    echo " - LINK IS VALID"
else
    echo " - ERROR - PROVIDED LINK IS NOT VALID"
    exit 1
fi


#set the name of the file name, so we canr refer to it
filename=$(basename "$ziplink")

#mske sure the file is a zip
if [[ $filename =~ \.zip$ ]]
then
    echo " - FILE IS VALID"
else
    echo " - ERROR - PROVIDED LINK IS NOT A ZIP"
    exit 1
fi


# let the user know we are downloading
echo " - DOWNLOADING ZIP"

# get the package
wget "$ziplink" -q

#create /resources/assets/favicon
echo " - CREATING FAVICON FOLDER IN " "$faviconfolder"
mkdir -p -- "$faviconfolder"

#check and see if a package isnt already there, if it is remove it
if [ -e "$faviconfolder"/"$filename" ]
then
    echo " - ZIP ALREADY EXISTS IN FOLDER - DELETING IT"
    rm "$faviconfolder"/"$filename"
else
    echo " - ZIP DOES NOT EXISTS IN FOLDER - CREATING IT"
fi

#move the package over to the folder we made
mv "$filename" "$faviconfolder"

#unzip the package
unzip "$faviconfolder"/"$filename" -d "$faviconfolder"

#remove thepackage
rm "$faviconfolder"/"$filename"

echo " - CREATING BLADE FILE"

#make the faviconviewfolder
mkdir -p -- "$faviconviewfolder"

#check and see if html_code exists, if it does move it, if it doesnt delete it
if [ -e "$faviconfolder"/html_code.html ]
then
    mv "$faviconfolder"/html_code.html "$faviconviewfolder"/favicon.blade.php
else
    echo " - ERROR - html_code does not exist, please go recreate your packageand make sure you select html_code include"
    exit 1
fi

echo " - BLADE FILE CREATED"

echo " - PUBLISHING FILES TO PUBLIC"


#publish dem good stuff to public
cp -a "$faviconfolder"/. public/

echo " - FILES HAVE BEEN PUBLISHED"

echo " - INSTALL DONE, SEE README FOR USEAGE"
