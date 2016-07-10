#!/bin/sh

# Fifi: a camera stills cleanup script.
# 2015 nanoscript

# script tests for jpeg pics within a camera upload folder, and creates a directory if necessary then moves the loose files into it.
# then we use "find" command to look for files and directories older than # days (-mtime +<numdays>), then removes files that are older than numdays.
# we use this to keep our camera stills folders from growing out of control.
CURTIME="$(date +%m-%d-%y_%T)"

cd /dir/1
 if [ `ls | grep -c jpg` -gt 0 ]
 then
    mkdir "$CURTIME" ; mv *.jpg /dir/1/"$CURTIME"
 fi
cd /dir/2
 if [ `ls | grep -c jpg` -gt 0 ]
 then
    mkdir "$CURTIME" ; mv *.jpg /dir/2/"$CURTIME"
 fi
#cd /dir/3
# if [ `ls | grep -c jpeg` -gt 0 ]
# then
#    mkdir "$CURTIME" ; mv *.jpeg /dir/3/"$CURTIME"
# fi

sleep 1
# sleep creates a gap between our create/move operations and our remove operations, so that the remove operation is always run later the
# the create/mod time of the files/folders

# CAREFUL! this script with "-rf" instead of just "-f" removes files AND subfolders. We must NOT execute this @a level higher than each upload folder.
# -mtime +numdays (older than 6 means 7 days)
find /dir/1 -mtime +6 -exec rm -rf {} \;
find /dir/2 -mtime +6 -exec rm -rf {} \;
#find /dir/3 -mtime +6 -exec rm -rf {} \;

sleep 1

find /dir/1 -type d -empty -exec rm -rf {} \;
find /dir/2 -type d -empty -exec rm -rf {} \;
#find /dir/3 -type d -empty -exec rm -rf {} \;

# the lines containining "-type d -empty" are for removing folders that are sometimes left due to modification date being changed upon removing files.
# these folders will be empty once all pics in them have aged according to script. This second operation cleans up those straggling folders that
# won't otherwise be removed by modification date alone.
