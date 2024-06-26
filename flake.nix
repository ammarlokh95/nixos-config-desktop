{
  description = "Home Manager configuration of slice";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";

    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    Neve = {
      url = "github:ammarlokh95/neovim-neve-nix";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, Neve, ... }@inputs:
  let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = import nixpkgs { 
          inherit system;

          config = {
            allowUnfree= true;
          };
        };
    in
    {
      homeConfigurations."slice" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./users/slice.nix ];
        extraSpecialArgs = {inherit inputs;};
      };

      nixosConfigurations = {
        slicenixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit system inputs outputs;};

          modules = [
            ./nixos/configuration.nix
            ];
          };
        };
    };
}
