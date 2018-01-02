#!/usr/bin/env bash

declare -a AFFECTED_APPS=(
    "Amphetamine" \
    "GIPHY CAPTURE" \
    "Transmission" \
)

main() {
    # Quit all apps we're going to configure                                      #
    quit_all_affected_apps
    # Configure all apps whose configurations are with plists
    configure_plist_apps
    # Start all apps we configured
    start_all_affected_apps
}

function quit_all_affected_apps() {
    for app in "${AFFECTED_APPS[@]}"
    do
        killall "$app" > /dev/null 2>&1
    done
}

function configure_plist_apps() {
    import_plist "com.if.Amphetamine" "Amphetamine.plist"
    import_plist "com.fasthatchapps.gifgrabberosx" "GIPHY_Capture.plist"
    import_plist "org.m0k.transmission" "Transmission.plist"
}

function start_all_affected_apps() {
    for app in "${AFFECTED_APPS[@]}"
    do
        osascript << EOM
tell application "$app" to activate
EOM
    done
}

function import_plist() {
    domain=$1
    filename=$2
    defaults delete "$domain"
    defaults import "$domain" "$filename"
}

main "$@"
