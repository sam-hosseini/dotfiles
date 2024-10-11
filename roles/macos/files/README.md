* Install Homebrew from [brew.sh](https://brew.sh)
* Clone dotfiles repository from [github](https://github.com/sam-hosseini/dotfiles)
* Install the following formulae:
    ```
    brew install ansible python3 fish mkcert
    ```
* Install fish and macos roles
    ```
    ansible-playbook bootstrap.yml --tags fish --tags macos
    ```
* Open a fish shell and execute `bootstrap`
* Sign in to the App Store and install all purchased applications
* Initiate `git push` and use Github personal access token in 1password for it
* Initiate `op account add --address my.1password.com`
* Clone all repos with `clone_repos` and move them all (except `dotfiles`) under the `repos` directory
* Input licenses of applications in 1password software licenses
* Set [un-automatable shortcuts](https://github.com/sam-hosseini/dotfiles/blob/main/roles/karabiner/files/shortcuts.md)
* Tweak system preferences settings
    * Users & Groups
        * Current User => Update picture
    * Accessibility
        * Zoom => Check Use scroll gesture with modifier keys to zoom
        * Display => Check Reduce transparency
    * Sound
        * Sound Effects => Uncheck Play sound on startup
    * Keyboard
        * Keyboard => Press Fn key to Change Input Source
        * Input Sources => Add "Persian - Standard" and "Finnish" and "Italian"
    * Display
        * Display => Uncheck Automatically adjust brightness
        * Night Shift => Schedule: Sunset to Sunrise
    * Battery
        * Battery => Uncheck Slightly dim the display on battery
    * Control Center
        * Manu Bar Only => Clock Options => Show date: Never and Uncheck Show the day of the week
