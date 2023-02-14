#!/usr/bin/env bash

info() {
  echo -e "INFO: $1"
}

warning() {
  echo -e "WARNING: $1"
}

info "Starting for $USER...\n"
sleep .1

read -p "$(info '👤 Enter your name: ')" AUTHOR
read -p "$(info '📧 Enter your email: ')" EMAIL

read -p "Please, specify the type of key (RSA, ECDSA or ED25519): " SSH_KEY_TYPE

case $SSH_KEY_TYPE in
1 | rsa | RSA)
  info "🔑 Generating SSH keys (RSA)..."
  ssh-keygen -t rsa -b 4096 -C "${EMAIL}" -f ~/.ssh/id_rsa
  ;;
2 | ec | ecdsa | ECDSA)
  info "🔑 Generating SSH keys (ECDSA)..."
  ssh-keygen -t ecdsa -b 521 -C "${EMAIL}" -f ~/.ssh/id_ecdsa
  ;;
3 | ed | ed25519 | ED25519)
  info "🔑 Generating SSH keys (ED25519)..."
  ssh-keygen -o -a 256 -t ed25519 -C "${EMAIL}" -f ~/.ssh/id_ed25519
  ;;
*)
  warning "⏩  Unknown key type. Skipping generation of keys..."
  ;;
esac

info "⚙️ Installing Xcode command line tools..."
xcode-select --install

info "🍺 Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

info "🍺 Installing homebrew cask"
brew install caskroom/cask/brew-cask

info "🍺 Homebrew: tap caskroom/versions..."
brew tap caskroom/versions

info "🍺 Homebrew: tap homebrew/cask-versions..."
brew tap homebrew/cask-versions

brew --version

info "⚙️ Installing Bartender"
brew install --cask bartender

info "⚙️ Installing Telegram..."
brew install --cask telegram-desktop

info "💻 Installing kitty"
brew install --cask kitty

info "💻 Installing Open In Terminal"
brew install --cask openinterminal

info "⚙️ Installing Visual Studio Code..."
brew install --cask visual-studio-code

info "⚙️ Installing Git..."
brew install git

info "⚙️ Installing GitHub CLI..."
brew install hub

info "⚙️ Configuring Git..."
git config --global user.name "${AUTHOR}"
git config --global user.email "${EMAIL}"

# See: https://www.gnu.org/software/coreutils/
info "⚙️ Installing GNU coreutils..."
brew install --force-bottle coreutils

# See: https://www.gnu.org/software/diffutils/
info "⚙️ Installing GNU diffutils..."
brew install --force-bottle diffutils

# See: https://savannah.gnu.org/projects/which/
info "⚙️ Installing GNU which..."
brew install gnu-which --with-default-names

# See: https://www.gnu.org/software/sed/
info "⚙️ Installing GNU sed..."
brew install gnu-sed --with-default-names

# See: https://www.gnu.org/software/findutils/
info "🔍 Installing GNU findutils (find, locate, updatedb, and xargs)..."
brew install --force-bottle findutils --with-default-names

# See: https://www.gnu.org/software/indent/
info "⚙️ Installing GNU Indent..."
brew install gnu-indent

# See: https://www.gnu.org/software/grep/
info "🔍 Installing GNU grep..."
brew install grep --with-default-names

info "🗜 Installing The Unarchiver..."
brew install --cask the-unarchiver

info "🗜 Install GNU tar..."
brew install gnu-tar --with-default-names

info "🗜 Installing unrar, xz and gzip..."
brew install unrar xz gzip

info "🔒 Installing OpenSSH..."
brew install openssh

info "🛠 Installing misc developer CLI-tools..."
dev_utils=(
  jq
  fzf
  bat
  wget
  tree
  trash
  tokei
  rename
  httpie
  neovim
  ffmpeg
  libjpeg
  gettext
  readline
  hadolint
  automake
  readline
  hyperfine
  shellcheck
  screenfetch
)

for package in "${dev_utils[@]}"; do
  info "⚙️ Installing ${package}..."
  brew install "${package}"
done

info "Installing fonts..."
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

info "💻 Changing macOS's settings..."
# Maximize windows on double clicking them:
defaults write -g AppleActionOnDoubleClick 'Maximize'

# Don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Improve security
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Show Finder path bar:
defaults write com.apple.finder ShowPathbar -bool true

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Disable autocorrect:
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable auto-capitalization:
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

killall Finder
killall Dock

info '✨ Done!'
