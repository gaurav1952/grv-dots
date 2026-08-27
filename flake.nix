
{
  description = "grv-dots config";

   nixConfig = {
     extra-substituters = [
        "https://vicinae.cachix.org"
        "https://noctalia.cachix.org"
     ];
     extra-trusted-public-keys = [
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
     ];
   };

      inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        home-manager = {
          url = "github:nix-community/home-manager/release-26.05";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
              url = "github:youwen5/zen-browser-flake";
              inputs.nixpkgs.follows = "nixpkgs";
        };

        helium = {
              url = "github:AlvaroParker/helium-nix";
              inputs.nixpkgs.follows = "nixpkgs";
         };

        vicinae.url = "github:vicinaehq/vicinae";

        mangowm = {
              url = "github:mangowm/mango";
              inputs.nixpkgs.follows = "nixpkgs";
        };
        noctalia = {
              url = "github:noctalia-dev/noctalia";
              # inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
        };
      };

      outputs = { self, nixpkgs, home-manager, ... }@ inputs: {
# ---------------------------------
#  Nixos Configurations
#  --------------------------------
        nixosConfigurations.grv = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
          ./configuration.nix
            inputs.mangowm.nixosModules.mango
          ];
        };
# ---------------------------------
#  home-manager
#  --------------------------------
      homeConfigurations.grv = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
            };
          extraSpecialArgs = {inherit inputs; };
          modules = [
            ./home.nix
            inputs.vicinae.homeManagerModules.default
            inputs.mangowm.hmModules.mango
            inputs.noctalia.homeModules.default
          ];
        };

    };

}
