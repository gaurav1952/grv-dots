{
  description = "grv-dots config";

  nixConfig = {
    extra-substituters = [
      "https://vicinae.cachix.org"
      "https://noctalia.cachix.org"
      "https://playit-nixos-module.cachix.org"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4="
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

    vicinae.url = "github:vicinaehq/vicinae";
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      # inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
    };

    # qylock = {
    #   url = "github:Darkkal44/qylock";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      playit-nixos-module,
      ...
    }@inputs:
    {
      # ---------------------------------
      #  Nixos Configurations
      #  --------------------------------
      nixosConfigurations.grv = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.mangowm.nixosModules.mango
          playit-nixos-module.nixosModules.default
          # qylock.nixosModules.default

          # Home Manager Module 
          # home-manager.nixosModules.home-manager
          # {
          #   nixpkgs.config = { allowUnfree = true; };

          #  home-manager = {
          #   useGlobalPkgs = true;
          #   useUserPackages = true;
          #   backupFileExtension = "backup";
          #   extraSpecialArgs = { inherit inputs; };
          #   sharedModules = [
          #     inputs.vicinae.homeManagerModules.default
          #     inputs.mangowm.hmModules.mango
          #     inputs.noctalia.homeModules.default
          #   ];
          #   users.g4ur4v = import ./home.nix;
          #  };
          # }

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
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          inputs.vicinae.homeManagerModules.default
          inputs.mangowm.hmModules.mango
          inputs.noctalia.homeModules.default
        ];
      };

    };

}
