#! /usr/bin/env bash

echo "Installing Firefox Developer Edition"
aria2c https://download.mozilla.org/\?product\=firefox-devedition-latest-ssl\&os\=linux64\&lang\=en-US
tar xjf firefox-*.tar.bz2 && rm -f firefox-*.tar.bz2
sudo mv firefox /opt/firefox-de
sudo chown -R $USER /opt/firefox-de
cat > ~/.local/share/applications/firefoxDeveloperEdition.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Firefox Developer Edition
Exec=/opt/firefox-de/firefox
Icon=/opt/firefox-de/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;Favorite;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognitos;
EOL