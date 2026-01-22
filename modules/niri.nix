{ config, lib, pkgs, inputs, ... }:
{

  programs.niri.enable = true;


  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    tokyonight-gtk-theme
    swayimg
    rose-pine-cursor
    pkgs.adwaita-icon-theme
    nemo
    fuzzel
    gpu-screen-recorder
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        user = "greeter";
      };

      initial_session = {
        command = "niri-session";
        user = "vv";
      };
    };
  };


}
