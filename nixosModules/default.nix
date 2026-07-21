{ ... }: { 
  imports = [
    ./installConfig.nix
    ./blacklist.nix
    ./alternatives.nix
    ./systemd.nix
  ];

  networking.hostName.default = "lcos";
}