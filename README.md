# [My macOS Empire](https://medium.com/@sam_hosseini/build-a-macos-empire-a0c83879ac24) 👑
[![my macOS empire](https://i.imgur.com/dSbidA6.png)](https://vimeo.com/samhosseini/my-macos-empire "Watch a sample executation of my macOS bootstrapping script")


* On a fresh macOS:

  * Setup for a software development environment entirely with a one-liner 🔥
    ```bash
    curl --silent https://raw.githubusercontent.com/sam-hosseini/dotfiles/master/setup-mac-os.sh | bash
    ```

  * Open a Fish shell and execute `compile_vim_plugins` and `install_oh_my_fish` functions.
  * Enter licesne information of purchased applications.
  * Manually set [un-automatable shortcuts](https://github.com/sam-hosseini/dotfiles/blob/master/shortcuts/shortcuts.md#un-automatable-shortcuts)

* Execute `bootstrap` function freely which in turn executes the bootstrapping script.
