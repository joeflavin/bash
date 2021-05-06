#!/bin/bash

###########################################################
#     Script to capture web radio streams from url        #
#   Records for x mins; tags file; Moves file to dir      #
#     use-case: set a cron-job for regular show           #
#             requires: ffmpeg, id3v2                     #
###########################################################

#echo "starting script $(date)" >> radiocap.out

# Fill in these variables to your requirements
show="Show Name"
artist="DJ/Presenter"
station="Radio Station Name"	# will mv to this dir in podcasts dir
storage="/path/to/podcast/dir"  # No trailing slash
# Set duration of recording e.g. "120m" for a 2hr recording
duration="1m"
# Example url of web radio stream
url="http://worldwidefm.out.airtime.pro:8000/worldwidefm_b"

today=$(date +%Y-%m-%d)
destination="${storage}/${station}/"
file="${station// /.}-${show// /.}-${today}.mp3"

# Capture stream
timeout "$duration" ffmpeg -nostdin -i "$url" -c copy "$file" > ffmpeg.out 2> ffmpeg.err

# Tag File
id3v2 -t "${show} ${today}" -a "${artist}" -A "${show}" --TPE2 "${station}"  "$file"

# Check destination directory exists
if [ ! -d "$destination" ];then
   mkdir "$destination"
fi

# Move recording
if mv "$file" "$destination"; then
   exit 0
else
   exit 1
fi

# Todo: Trigger DB Update
# Todo: Better Error Catching
# Todo: Take in variables from cmd-line
