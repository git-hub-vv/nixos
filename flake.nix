{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = inputs: {

    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          { nix.settings.experimental-features = ["nix-command" "flakes"]; }
          ./hosts/configuration.nix
        ];
    };

  };
}
