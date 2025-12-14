{ config, lib, pkgs, ... }:
{

  options =
  {
    dev.enable = lib.mkEnableOption "enables gaming";
  };

  config = lib.mkIf config.dev.enable {


    # packages
    environment.systemPackages = with pkgs;
    [
      # general
      zed-editor

      # C lang
      clang-tools  #C/C++ language server
      gdb          #debugger
      gcc          #C compiler
    ];


  };
}
