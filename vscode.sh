# !/bin/bash

# install vscode extensions
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension ms-vscode.cpptools
code --install-extension golang.go
code --install-extension ms-python.python
code --install-extension ms-vscode-remote.remote-containers
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension dart-code.flutter
code --install-extension visualstudiotoolsforunity.vstuc
code --install-extension unity.unity-debug
code --install-extension mermaidchart.vscode-mermaid-chart
code --install-extension hashicorp.terraform
code --install-extension k--kato.docomment

CURRENT_DIR=`pwd`
ln -s $CURRENT_DIR/vscode/launch.json ~/Library/Application\ Support/Code/User/launch.json
ln -s $CURRENT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $CURRENT_DIR/vscode/tasks.json ~/Library/Application\ Support/Code/User/tasks.json
