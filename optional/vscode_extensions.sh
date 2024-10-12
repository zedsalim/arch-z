#!/bin/bash

install_extension() {
    if ! code --list-extensions | grep -q "$1"; then
        echo "Installing $1..."
        code --install-extension "$1"
    else
        echo "$1 is already installed."
    fi
}

extensions=(
    "batisteo.vscode-django"
    "bracketpaircolordlw.bracket-pair-color-dlw"
    "christian-kohler.path-intellisense"
    "dbaeumer.vscode-eslint"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "formulahendry.auto-close-tag"
    "formulahendry.auto-rename-tag"
    "formulahendry.code-runner"
    "github.vscode-github-actions"
    "hediet.vscode-drawio"
    "jeff-hykin.polacode-2019"
    "llvm-vs-code-extensions.vscode-clangd"
    "mikestead.dotenv"
    "ms-python.debugpy"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "naumovs.color-highlight"
    "oderwat.indent-rainbow"
    "pkief.material-icon-theme"
    "qwtel.sqlite-viewer"
    "ritwickdey.liveserver"
    "streetsidesoftware.code-spell-checker"
    "vscodevim.vim"
    "wayou.vscode-todo-highlight"
    "xabikos.javascriptsnippets"
    "yzane.markdown-pdf"
    "yzhang.markdown-all-in-one"
)

for extension in "${extensions[@]}"; do
    install_extension "$extension"
done
