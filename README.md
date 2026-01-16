# my NixOS configuration
## hosts
there is a folder for each host ontaining their configuration.nix, hardware-configuration.nix and flake.nix / flake.lock, which is copied to each systems /etc/nixos
## modules
modules can be bundles of software, and anything else I would usually like to import in bulk
## home-manager
currently not really used, something to add later
## rebuild
sudo nixos-rebuild switch --flake /home/vv/nixos/hosts/desktop-9800x3d/ --impure
sudo nixos-rebuild switch --flake /home/nain/nixos/hosts/tux-ibp15/ --impure
