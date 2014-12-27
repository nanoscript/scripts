#! /bin/sh

# GNOAA- a quick script to provide spoken NOAA forecasts (from festival) on GNU based systems.
# This is intended to blatently mimic NOAA weather radio broadcasts using GNU software.
#
# Requires package "Festival" be installed and in working order with sound.
# Also requires a working URL for your location be hardcoded into the script in the "NOAAURL"
# definition below. Hint: go to noaa, find out your locale (in my case NYZ003). Then use
# a search engine of your choice searching for "<your locale> txt". In a perfect world you
# will be pointed to a URL like the example, which is a .txt file.


# change this URL as necessary for your needs:
NOAAURL=http://weather.noaa.gov/pub/data/forecasts/zone/ny/nyz003.txt


# this script will leave a file named "lastWeather.txt" in whatever directory the script is
# called from
wget -q -O lastWeather.txt $NOAAURL


# Now using the text file as input we wash it through Sed a few times to create a usable
# input for festival:
A2=$(sed 's/[![]]//g' lastWeather.txt)
A3=$(echo $A2 | sed 's/[()"-]//g')
A4=$(echo $A3 | sed 's/[:;.$]//g')

A6="\"$A4\""  #places quotes around our text so we can pipe it into festival:

echo "(SayText $A6)" | festival &    #runs our voice command in background with festival

# wishlist, work on the sed commands to make the input to festival a little (a lot?) cleaner.
# work on the festival command to obtain a voice that works a little better for this task
# and that more closely resembles at least one NOAA weather radio voice.
# try espeak
# add ability to prepend/append text to audio output
