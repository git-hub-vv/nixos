{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # Replace <flake-path> with the path to your flake or flake URL
    (import "./" {}).packages.${pkgs.system}.default
  ];
}
