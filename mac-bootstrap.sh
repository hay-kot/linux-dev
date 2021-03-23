#!/usr/bin/env zsh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Installing brew cask..."
brew tap homebrew/cask

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
# brew tap homebrew/dupes
# brew install coreutils
# brew install gnu-sed --with-default-names
# brew install gnu-tar --with-default-names
# brew install gnu-indent --with-default-names
# brew install gnu-which --with-default-names
# brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
# brew install findutils

# Install Bash 4
# brew install bash 

## Non Cask
PACKAGES=(
    ansible
    bash
    bat
    gh
    htop
    lf
    nmap
    node@14
    nvm
    pipx
    poetry
    rclone
    tree
    vips
    wget
    wireguard-go
    yarn
    youtube-dl
    zsh-autosuggestions
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

CASKS=(
    android-file-transfer
    bitwarden
    brave-browser
    discord
    drawio
    firefox
    github
    home-assistant
    iterm2
    microsoft-auto-update
    microsoft-office
    private-internet-access
    qbittorrent
    signal
    spotify
    sqlpro-for-sqlite
    visual-studio-code
    vlc
    zoom
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

brew tap homebrew/cask-fonts
echo "Installing fonts..."
FONTS=(
    font-fira-code
)
brew install --cask ${FONTS[@]}

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    ipython
    virtualenv
    virtualenvwrapper
)
sudo pip install ${PYTHON_PACKAGES[@]}