#!/bin/bash

# Update, upgrade and autoremove
sudo dnf -y update && sudo dnf -y upgrade && sudo dnf -y autoremove

# Install Firefox Developer Edition
cd ~/Downloads
wget https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US -O firefox-developer.tar.bz2
tar -xvjf firefox-developer.tar.bz2
sudo mv firefox /opt/firefox-developer
sudo ln -s /opt/firefox-developer/firefox /usr/local/bin/firefox-developer

# Create desktop entry for Firefox Developer Edition
sudo tee /usr/share/applications/firefox-developer.desktop <<EOL
[Desktop Entry]
Name=Firefox Developer Edition
GenericName=Web Browser
Exec=/usr/local/bin/firefox-developer %u
Icon=/opt/firefox-developer/browser/chrome/icons/default/default128.png
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;
X-Desktop-File-Install-Version=0.23
EOL

sudo update-desktop-database

# Install Docker
sudo dnf remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a $USER docker

# Install VirtualBox
sudo dnf -y install https://download.virtualbox.org/virtualbox/7.0.18/VirtualBox-7.0-7.0.18_162988_fedora40-1.x86_64.rpm
sudo modprobe -a vboxdrv

# Install Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
sudo dnf check-update
sudo dnf install -y code

# Install GNOME Extensions
gnome-extensions install --system dash-to-dock@micheleg.gmail.com
gnome-extensions install --system applet@virtualbox.org
gnome-extensions install --system docker-integration@fr
gnome-extensions install --system removable-drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions install --system gsconnect@andyholmes.github.io

# Install gnome-pomodoro
sudo dnf -y install gnome-pomodoro.x86_64

# Install Git
sudo dnf install -y git

# Install Zoom
cd ~/Downloads
wget https://zoom.us/client/latest/zoom_x86_64.rpm
sudo dnf -y install ./zoom_x86_64.rpm

# Install Ranger
sudo dnf -y install ranger

# Install Neovim
sudo dnf -y install neovim

# Install Quarto
cd ~/Downloads
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.554/quarto-1.4.554-linux-rhel7-amd64.tar.gz
tar -xvzf quarto-1.4.554-linux-rhel7-amd64.tar.gz
sudo mv quarto-1.4.554 /opt/quarto
sudo ln -s /opt/quarto/bin/quarto /usr/local/bin/quarto

# Verify Quarto installation
quarto --version

# Install Spotify
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install spotify

# Install Oh My Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Install GIMP and Inkscape
sudo dnf install -y gimp inkscape

