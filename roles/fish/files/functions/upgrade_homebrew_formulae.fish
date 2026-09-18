function upgrade_homebrew_formulae
    brew update 2>/dev/null | grep --invert-match --regexp "Already up-to-date." --regexp "Updating Homebrew..."

    brew upgrade --formulae

    brew cleanup

    brew doctor | grep --invert-match "Your system is ready to brew."
end
