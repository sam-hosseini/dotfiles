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
* Run `git remote set-url origin git@github.com:sam-hosseini/dotfiles.git` in `dotfiles` repo
* Initiate `op account add --address my.1password.com`
* Clone all repos with `clone_repos` and move them all (except `dotfiles`) under the `repos` directory
* Input licenses of applications in 1password software licenses
* Set [un-automatable shortcuts](https://github.com/sam-hosseini/dotfiles/blob/main/roles/karabiner/files/shortcuts.md)
* Tweak System Settings
    * Battery
        * Options => Uncheck Slightly dim the display on battery
    * Accessibility
        * Zoom => Check Use scroll gesture with modifier keys to zoom
    * Menu Bar
        * Recent documents, applications and servers => None
        * Manu Bar Controls => Clock Options => Show date: Never and Uncheck Show the day of the week
    * Desktop & Dock
        * Desktop & Stage Manager => Show Desktop => Only in Stage Manager on Click
    * Displays
        * Displays => Uncheck Automatically adjust brightness
        * Night Shift => Schedule: Sunset to Sunrise
    * Sound
        * Sound Effects => Uncheck Play sound on startup
    * Privacy & Security
        * Security => Allow applications from => Anywhere
    * Users & Groups
        * Current User => Update picture
    * Keyboard
        * Keyboard => Press 🌐︎ key to Change Input Source
        * Text Input => Input Sources => Add "Persian - Standard" and "Finnish"
