{ config, pkgs, ... }:

{
let
  # Make relative path absolute relative to this file
  nixvimFlake = builtins.path ./;
in
{
  environment.systemPackages = [
    (builtins.getFlake nixvimFlake).packages.${pkgs.system}.default
  ];
}


#  environment.systemPackages = [
#    # Replace <flake-path> with the path to your flake or flake URL
#    (import "./" {}).packages.${pkgs.system}.default
#  ];
#}

