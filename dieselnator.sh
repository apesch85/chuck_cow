#! /bin/bash

# Takes $JOKE and replaces Chuck Norris with Vin Diesel

dieselfy () {
VINJOKE=$1 # takes $JOKE
VIN=$(sed 's/Chuck/Vin/gI' <<< $VINJOKE) # Replace Chuck with Vin
DIESEL=$(sed 's/Norris/Diesel/gI' <<< $VIN) # Replace Norris with Diesel
JOKE="$DIESEL"
}
