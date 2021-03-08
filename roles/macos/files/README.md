* Ensure that you're signed in to the App Store
* Install Homebrew from [brew.sh](https://brew.sh)
* Clone dotfiles repository from [github](https://github.com/sam-hosseini/dotfiles)
* Install Ansible, Fish and Mac App Store cli:
    ```
    brew install ansible fish mas
    ```
* Install fish and macos roles
    ```
    sudo --validate; ansible-playbook bootstrap.yml --tags fish --tags macos
    ```
* Open a fish shell and execute `bootstrap`
* Initiate `git push` and use Github personal access token in 1password for it
* Initiate `op signin my 1password_email`
* Clone all repositories with `clone_repos`
* Input licenses of applications in 1password software licenses
* Set [un-automatable shortcuts](https://github.com/sam-hosseini/dotfiles/blob/main/roles/karabiner/files/shortcuts.md)
* Tweak system preferences settings
    * Accessibility
        * Display => Check Reduce transparency
    * Sound
        * Sound Effects => Uncheck Play sound on startup
    * Keyboard
        * Keyboard => Press Fn key to Change Input Source
        * Input Sources => Add "Persian - Standard" and "Finnish"
    * Display
        * Display => Uncheck Automatically adjust brightness
        * Night Shift => Schedule: Sunset to Sunrise
    * Battery
        * Battery => Uncheck Slightly dim the display while on battery power
