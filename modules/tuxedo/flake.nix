{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    tuxedo-nixos = {
      url = "github:blitz/tuxedo-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, tuxedo-nixos }: {
    nixosConfigurations = {
      your-system = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          tuxedo-nixos.nixosModules.default
          { hardware.tuxedo-control-center.enable = true; }
        ];
      };
    };
  };
}
