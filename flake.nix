{
  description = "Configuración de NixOS de passh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      aurin = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          

          

          ./hosts/aurin/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.passh = import ./home/passh/home.nix;
          }
        ];
      };
    };
  };
}

