function update_homebrew
    brew update 2>/dev/null | grep --invert-match --regexp "Already up-to-date." --regexp "Updating Homebrew..."

    brew upgrade --formulae

    brew outdated --cask --greedy --verbose | grep --invert-match latest | awk '{print $1;}' | xargs brew upgrade --cask

    brew cleanup

    brew doctor | grep --invert-match "Your system is ready to brew."
end
