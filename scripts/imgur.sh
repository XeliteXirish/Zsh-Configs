#!/bin/bash

apikey="ea6c0ef2987808e"

# function to output usage instructions
function usage {
    echo "Usage: $(basename $0) <filename> [<filename> [...]]" >&2
    echo "Upload images to imgur and output their new URLs to stdout. Each one's" >&2
    echo "delete page is output to stderr between the view URLs." >&2
    echo "If xsel or xclip is available, the URLs are put on the X selection for" >&2
    echo "easy pasting." >&2
}

# check API key has been entered
if [ "$apikey" = "Your API key" ]; then
    echo "You first need to edit the script and put your API key in the variable near the top." >&2
    exit 15
fi

# check arguments
if [ "$1" = "-h" -o "$1" = "--help" ]; then
    usage
    exit 0
elif [ $# == 0 ]; then
    echo "No file specified" >&2
    usage
    exit 16
fi

# check curl is available
type curl >/dev/null 2>/dev/null || {
    echo "Couln't find curl, which is required." >&2
    exit 17
}

clip=""
errors=false

# loop through arguments
while [ $# -gt 0 ]; do
    file="$1"
    shift

    # check file exists
    if [ ! -f "$file" ]; then
        echo "file '$file' doesn't exist, skipping" >&2
        errors=true
        continue
    fi
    echo "Uploading image.. please wait"
    # upload the image
    response=$(curl -s -H "Authorization: Client-ID $apikey" -F "image=@$file" \
            https://api.imgur.com/3/upload.xml)
    # the "Expect: " header is to get around a problem when using this through 
    # the Squid proxy. Not sure if it's a Squid bug or what.
    if [ $? -ne 0 ]; then
        echo "Upload failed" >&2
        errors=true
        continue
    elif [ $(echo $response | grep -c "<error_msg>") -gt 0 ]; then
        echo "Error message from imgur:" >&2
        echo $response | sed -r 's/.*<error_msg>(.*)<\/error_msg>.*/\1/' >&2
        errors=true
        continue
    fi

    # parse the response and output our stuff
    url=$(echo $response | sed -r 's/.*<link>(.*)<\/link>.*/\1/')
 deleteurl="http://i.imgur.com/delete/$(echo $response |\
 sed -r 's/.*<deletehash>(.*)<\/deletehash>.*/\1/')"
    echo $url
    echo "Delete page: $deleteurl" >&2

    # append the URL to a string so we can put them all on the clipboard later
    clip="$clip$url
"
done

# put the URLs on the clipboard if we have xsel or xclip
if [ $DISPLAY ]; then
    { type xsel >/dev/null 2>/dev/null && echo -n $clip | xsel; } \
        || { type xclip >/dev/null 2>/dev/null && echo -n $clip | xclip; } \
        || echo "Haven't copied to the clipboard: no xsel or xclip" >&2
fi

if $errors; then
    exit 1
fi
