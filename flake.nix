{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, ... }@inputs:
    inputs.utils.lib.eachSystem [ "aarch64-darwin" "x86_64-darwin" ] (system:
      let
        name = "Hammerspoon";
        pkgs = import nixpkgs { inherit system; };
        version = "0.9.100";
      in {
        packages.default = pkgs.callPackage ./default.nix {
          name = name;
          pkgs = pkgs;
          version = version;
        };
      });
}
