{ config, pkgs, ... }:

{

  # enable dconf (system management tool)
  programs.dconf.enable = true;

  # add user to libvirtd group
  users.users.vv.extraGroups = [ "libvirtd" ];

  # packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];

  # manage virtualization services
  virtualization = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
	ovmf.enable = true;
	ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

}
