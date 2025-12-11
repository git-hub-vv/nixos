{ config, lib, pkgs, ... }:
{

  options =
  {
    vm.enable = lib.mkEnableOption "enables vm";
  };

  config = lib.mkIf config.vm.enable {

    # enable dconf (system management tool)
    programs.dconf.enable = true;

    # add user to libvirtd group
    users.users.vv.extraGroups = [ "libvirtd" ];

    # packages
    environment.systemPackages = with pkgs;
    [
      virt-manager
      virt-viewer
      spice spice-gtk
      spice-protocol
      virtio-win
      win-spice
      adwaita-icon-theme
    ];

    # manage virtualization services
    virtualisation = {
      libvirtd = {
        enable = true;
        #qemu = {
          #swtpm.enable = true;
          #ovmf.enable = true;
          #ovmf.packages = [ pkgs.OVMFFull.fd ];
        #};
        #was necessary in package channel 25.5 - removed it on 2025-12-11
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;

  };
}
