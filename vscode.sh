# !/bin/bash

# install vscode extensions
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.cpptools
code --install-extension golang.go
code --install-extension ms-python.python
code --install-extension jebbs.plantuml
code --install-extension ms-vscode-remote.remote-containers
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension dart-code.flutter

CURRENT_DIR=`pwd`
ln -s $CURRENT_DIR/vscode/launch.json ~/Library/Application\ Support/Code/User/launch.json
ln -s $CURRENT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $CURRENT_DIR/vscode/tasks.json ~/Library/Application\ Support/Code/User/tasks.json
