#! /bin/bash

# Takes $JOKE and replaces Chuck Norris with Vin Diesel

dieselfy () {
VINJOKE=$1 # takes $JOKE
VIN=$(sed -e 's/Chuck/Vin/gI' <<< $VINJOKE) # Replace Chuck with Vin
DIESEL=$(sed -e 's/Norris/Diesel/gI' <<< $VIN) # Replace Norris with Diesel
$1=$DIESEL
}
