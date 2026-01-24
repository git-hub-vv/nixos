{ config, lib, pkgs, ... }:
{

  options =
  {
    gaming.enable = lib.mkEnableOption "enables gaming";
  };

  config = lib.mkIf config.gaming.enable {

    programs.steam = {
      enable = true;
    };
    environment.sessionVariables = {
      STEAM_USE_X11 = "1";
      STEAM_NO_SANDBOX = "1";
    };
    # packages
    environment.systemPackages = with pkgs;
    [
      mangohud  # overlay for fps, temps etc.
      heroic
      protonup-rs
    ];


  };
}
