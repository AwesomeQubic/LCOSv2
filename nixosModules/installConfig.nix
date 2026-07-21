{ pkgs, options, ...}: let 
  flake = ''
    {
      inputs = {
        # This is pointing to an unstable release.
        # If you prefer a stable release instead, you can change the word unstable to the latest number shown here: https://nixos.org/download
        # i.e. nixos-24.11
        # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        lcos.url = "github:AwesomeQubic/lcosv2";
      };
      outputs = inputs\@{ self, nixpkgs, lcos, ... }: {
        # NOTE: '${options.networking.hostName.default}' is the default hostname
        nixosConfigurations.${options.networking.hostName.default} = nixpkgs.lib.nixosSystem {
          modules = [ 
            ./configuration.nix
            lcos.nixosModules.default
          ];
        };
      };
    }
  '';
in {

  system.nixos-generate-config = {
    inherit flake;
  };

  # Set it to use flake
  environment.etc."nixos-generate-config.conf".text = ''
    [Defaults]
    Flake=true
  '';
}