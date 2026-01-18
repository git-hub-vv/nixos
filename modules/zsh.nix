{ config, lib, pkgs, ... }:
{

  #options = { zsh.enable = lib.mkEnableOption "enables zsh";};
  #config = lib.mkIf config.zsh.enable {}

  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.shells = with pkgs; [ zsh ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ]

    ohMyZsh = {
      enable = true;
      plugins =[ "git" "dirhistory" "history" ];
    };
    shellAliases = {
      ll = "ls -l";
    };
  };
  users.defaultUserShell = pkgs.zsh;
 

  # packages
  environment.systemPackages = with pkgs;
  [
  ];

}
