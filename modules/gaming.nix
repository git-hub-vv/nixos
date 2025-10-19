{ config, lib, pkgs, ... }:
{

  options =
  {
    gaming.enable = lib.mkEnableOption "enables gaming";
  };

  config = lib.mkIf config.gaming.enable {

    programs.steam.enable = true;   # steam

    # packages
    environment.systemPackages = with pkgs;
    [
      mangohud  # overlay for fps, temps etc.
    ];


  };
}
