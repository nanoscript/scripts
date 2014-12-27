#!/bin/sh

# wxget, a simple command line utility for displaying your local weather on a command line output
# The only requirement is that wget and less are installed on your system (they probably already are)
#   --------------Special thanks to PhirePhly for cleaning this up a bit!

# Look up zone number here: http://www.nws.noaa.gov/mirs/public/prods/maps/pfzones_list.htm
STATE=ny
NOAAZONE=003

NOAAURL="http://weather.noaa.gov/pub/data/forecasts/zone/$STATE/$STATE""z$NOAAZONE.txt"
wget -q -O - $NOAAURL | less
