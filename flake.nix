{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default-linux";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    sops-nix,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;

    forEachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = nixpkgs.lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
        }
    );
  in {
    overlays = import ./overlays {inherit inputs outputs;};

    formatter = forEachSystem (pkgs: pkgs.alejandra);

    nixosConfigurations = {
      teio = nixpkgs.lib.nixosSystem {
        modules = [./hosts/teio];
        specialArgs = {inherit inputs outputs;};
      };
      urara = nixpkgs.lib.nixosSystem {
        modules = [./hosts/urara];
        specialArgs = {inherit inputs outputs;};
      };
    };
  };
}
