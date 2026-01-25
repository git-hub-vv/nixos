{ config, lib, pkgs, inputs, ... }:
{

  programs.niri.enable = true;  

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    xwayland
    tokyonight-gtk-theme
    swayimg
    rose-pine-cursor
    pkgs.adwaita-icon-theme
    nemo
    fuzzel
    gpu-screen-recorder
    qt6.qtwayland
    brightnessctl
    ddcutil
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = false;
  services.xserver.desktopManager.xterm.enable = false;

  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        user = "greeter";
      };
      init_session = {
        user = "vv";
      };
    };
  };


}
