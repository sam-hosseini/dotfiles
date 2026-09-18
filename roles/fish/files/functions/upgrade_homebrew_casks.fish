function upgrade_homebrew_casks
    brew update 2>/dev/null | grep --invert-match --regexp "Already up-to-date." --regexp "Updating Homebrew..."

    brew outdated --cask --greedy --verbose | grep --invert-match latest | awk '{print $1;}' | xargs brew upgrade --cask
end
