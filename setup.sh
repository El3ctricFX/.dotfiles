echo "THIS WILL DELETE ALL YOUR CURRENT CONFIGURATION FILES."
read -p "Are you sure you want to continue? [y/N]: " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "Proceeding with setup..."

    cd ~ || exit

    git clone https://github.com/El3ctricFX/.dotfiles.git

    cd ~/.config || exit

    rm -rf waybar && ln -s ~/.dotfiles/waybar .
    rm -rf hypr && ln -s ~/.dotfiles/hypr .
    rm -rf fastfetch && ln -s ~/.dotfiles/fastfetch .
    rm -rf dooit && ln -s ~/.dotfiles/dooit .
    rm -rf kitty && ln -s ~/.dotfiles/kitty .
    rm -rf nvim && ln -s ~/.dotfiles/nvim .
    rm -rf rofi && ln -s ~/.dotfiles/rofi .
    rm -f starship.toml && ln -s ~/.dotfiles/starship.toml .

    cd ~ || exit

    rm -f .zshrc && ln -s ~/.dotfiles/zsh/.zshrc .
    ln -s ~/.dotfiles/zsh/.zsh_aliases .

    cd /etc/ || exit

    sudo rm -rf nixos
    sudo ln -s ~/.dotfiles/nixos .

    echo "Setup complete."

else
    echo "Aborted."
    exit 1
fi

