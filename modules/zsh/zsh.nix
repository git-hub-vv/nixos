{ config, lib, pkgs, ... }:
{

  #options = { zsh.enable = lib.mkEnableOption "enables zsh";};
  #config = lib.mkIf config.zsh.enable {}

  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.shells = with pkgs; [ zsh ];
  environment.etc."zshrc.local".text = ''
    export POWERLEVEL9K_CONFIG_FILE=/etc/p10k.zsh
    export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=false

    [[ -f /etc/p10k.zsh ]] && source /etc/p10k.zsh
  '';
  programs.zsh = {
    promptInit = ''
    source /run/current-system/sw/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        '';

    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    ohMyZsh = {
      enable = true;
      plugins =[ "git" "dirhistory" "history" ];
    };
    shellAliases = {
      ll = "ls -l";
    };
  };
  users.defaultUserShell = pkgs.zsh;

  environment.etc."p10k.zsh".source = ./p10k.zsh;

  # packages
  environment.systemPackages = with pkgs;
  [
    zsh
    zsh-powerlevel10k
    git
  ];
  fonts.packages = [ pkgs.meslo-lgs-nf ];

}
