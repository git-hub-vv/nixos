{ config, lib, pkgs, ... }:
{

  options =
  {
    gaming.enable = lib.mkEnableOption "enables gaming";
  };

  config = lib.mkIf config.gaming.enable {

      programs.steam.enable = true;

    # packages
    environment.systemPackages = with pkgs;
    [

    ];


  };
}
