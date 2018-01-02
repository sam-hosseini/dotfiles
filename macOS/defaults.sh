#!/usr/bin/env bash

declare -a AFFECTED_APPS=(
    "Amphetamine" \
    "GIPHY CAPTURE" \
    "Transmission" \
    "Finder" \
)

main() {
    quit_all_affected_apps
    configure_plist_apps # Configure all apps whose configurations are plists
    configure_finder
    configure_screen
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

function configure_screen() {
    # Save screenshots to Downloads folder
    defaults write com.apple.screencapture location -string "${HOME}/Downloads"
    # Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0
}

function configure_finder() {
    # allow quitting via ⌘ + q; doing so will also hide desktop icons
    defaults write com.apple.finder QuitMenuItem -bool true
    # disable window animations and Get Info animations
    defaults write com.apple.finder DisableAllAnimations -bool true
    # Set Downloads as the default location for new Finder windows
    defaults write com.apple.finder NewWindowTarget -string "PfLo"
    defaults write com.apple.finder NewWindowTargetPath -string \
        "file://${HOME}/Downloads/"
    # disable status bar
    defaults write com.apple.finder ShowStatusBar -bool false
    # disable path bar
    defaults write com.apple.finder ShowPathbar -bool false
    # Display full POSIX path as Finder window title
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    # Keep folders on top when sorting by name
    defaults write com.apple.finder _FXSortFoldersFirst -bool true
    # When performing a search, search the current folder by default
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    # Disable disk image verification
    defaults write com.apple.frameworks.diskimages \
        skip-verify -bool true
    defaults write com.apple.frameworks.diskimages \
        skip-verify-locked -bool true
    defaults write com.apple.frameworks.diskimages \
        skip-verify-remote -bool true
    # Use list view in all Finder windows by default
    # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
    # Disable the warning before emptying the Trash
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
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
