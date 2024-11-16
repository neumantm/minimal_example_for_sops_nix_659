{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  inputs.sops-nix.url = "github:Mic92/sops-nix/c9f6b151cc3578f6517a5dbd152f0e29cc6d875f";
  inputs.sops-nix.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs: {
    nixosConfigurations = let
      lib = inputs.nixpkgs.lib;
    in {
      vm = lib.makeOverridable lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            system.stateVersion = "24.05";
          }
          {
            environment.etc."age-keys.txt".source = "${./age-keys.txt}";
          }
          inputs.sops-nix.nixosModules.sops
          {
            imports = [
              ./nix-sops.nix
            ];
          }
        ];
      };
    };
  };
}
