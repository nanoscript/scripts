#!/bin/bash

A1=$(fortune -o -s) #creates a variable containing a short and offensive fortune. PLEASE REMOVE -o switch if this offends you!

# here we need to remove any quotes", apostraphes', and parentheses () from our fortunes:
A2=$(echo $A1 | sed 's/[![]]//g')
A3=$(echo $A2 | sed 's/[()"-]//g')    #apparent limitations of sed requires a second pass to remove more characters

A6="\"$A3\""     #places quotes around our fortune so we can easily pipe it into festival:

echo "(SayText $A6)" | festival &    #runs our voice command in background with festival
