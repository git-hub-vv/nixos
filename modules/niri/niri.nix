{ config, lib, pkgs, inputs, ... }:
{

  programs.niri.enable = true

  # place niri config
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # packages
  environment.systemPackages = with pkgs;
  [
  ];


}
