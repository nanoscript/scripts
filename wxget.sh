#! /bin/sh

# wxget, a simple command line utility for displaying your local weather on a command line output
# The only requirements are that wget be installed on your system (it probably already is)
# and that you have the correct URL for your local weather report in a txt file from NOAA
# Hint: go to noaa, find out your locale (in my case NYZ003). Then use
# a search engine of your choice searching for "<your locale> txt". In a perfect world you
# will be pointed to a URL like the example, which is a .txt file.


NOAAURL=http://weather.noaa.gov/pub/data/forecasts/zone/ny/nyz003.txt


# this script will leave a file named "lastWeather.txt" in whatever directory the script is called from
wget -q -O lastWeather.txt $NOAAURL ;

A=$(cat lastWeather.txt)

echo $A
