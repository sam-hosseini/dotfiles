function update_homebrew
    brew update | grep --invert-match "Already up-to-date."

    brew upgrade --formulae

    brew outdated --cask --greedy --verbose | grep --invert-match latest | awk '{print $1;}' | xargs brew upgrade --cask

    brew cleanup

    brew doctor | grep --invert-match "Your system is ready to brew."
end
