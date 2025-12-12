{ config, pkgs, ... }:
#let
#  nixvimFlake = builtins.getFlake "/home/vv/nixos/modules/nixvim";
#in
#{
#  environment.systemPackages = [
#    nixvimFlake.packages.${pkgs.system}.default
#  ];
#}

{
environment.systemPackages = [
  (builtins.getFlake "/home/vv/nixos/modules/nixvim").packages.${pkgs.system}.default
];
}

#{
#  environment.systemPackages = [
#    # Replace <flake-path> with the path to your flake or flake URL
#    (import "/home/vv/nixos/modules/nixvim/flake.nix" {}).packages.${pkgs.system}.default
#  ];
#}

