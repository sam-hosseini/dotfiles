#!/usr/bin/env bash

declare -a Apps=(
    "Amphetamine" \
    "GIPHY CAPTURE" \
    "Transmission" \
)

###############################################################################
# Helper functions                                                            #
###############################################################################
function import_plist() {
    domain=$1
    filename=$2
    defaults delete "$domain"
    defaults import "$domain" "$filename"
}

###############################################################################
# Quit all apps we're going to configure                                      #
###############################################################################
for app in "${Apps[@]}"
do
    killall "$app" > /dev/null 2>&1
done

###############################################################################
# Apps to configure using plist                                               #
###############################################################################
import_plist "com.if.Amphetamine" "Amphetamine.plist"
import_plist "com.fasthatchapps.gifgrabberosx" "GIPHY_Capture.plist"
import_plist "org.m0k.transmission" "Transmission.plist"

###############################################################################
# Start all apps we configured                                                #
###############################################################################
for app in "${Apps[@]}"
do
    osascript << EOM
tell application "$app" to activate
EOM
done
