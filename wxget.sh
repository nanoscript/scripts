#!/bin/sh

# wxget, a simple command line utility for displaying your local weather on a command line output
# The only requirements is that wget be installed on your system (it probably already is)
#   --------------Special thanks to PhirePhly for cleaning this up a bit!

# Look up zone number here: http://www.nws.noaa.gov/mirs/public/prods/maps/pfzones_list.htm
STATE=ny
NOAAZONE=003


NOAAURL="http://weather.noaa.gov/pub/data/forecasts/zone/$STATE/$STATE""z$NOAAZONE.txt"
wget -q -O - $NOAAURL | less
