{
    description = "Nix in my ArchLinux";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/NUR";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland = {
            url = "github:hyprwm/Hyprland/";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, nur, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            lib = nixpkgs.lib;
        in {
            homeConfigurations.mere = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    inputs.hyprland.homeManagerModules.default
                    ./user/Philomatics.nix
                ];
                # specialArgs = { inherit inputs; };
            };
        };
}
