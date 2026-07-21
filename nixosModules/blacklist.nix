{ ... }: {
  nixpkgs.overlays = [
    (self: super: {
      xorg-server = abort "XORG is not allowed anymore";
    })
  ];
}