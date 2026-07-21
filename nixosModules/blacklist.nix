{ ... }: {
  nixpkgs.overlays = [
    (self: super: {
      xorg-server = abort "Lunduke Computer Operating System does not allow XORG anymore please use wayland";
      xwayland-satellite = abort "Lunduke Computer Operating System does not allow XORG compatibility anymore please use wayland";
    })
  ];
}