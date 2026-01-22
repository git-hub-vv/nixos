{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    zig.url = "github:mitchellh/zig-overlay";

    noctalia.url = "github:noctalia-dev/noctalia-shell";

  };

  outputs = { self, nixpkgs, zig, noctalia, ... }@inputs: {

    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          { nix.settings.experimental-features = ["nix-command" "flakes"]; }
          ./configuration.nix
        ];
    };

  };
}
