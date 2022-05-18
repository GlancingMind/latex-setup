{
  description = "Report of my project phase";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.11;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        config = { allowUnfree = false; };
        inherit system;
      };
    in rec {
      packages = {
        report = pkgs.callPackage ./report {};
      };
      defaultPackage = packages.report;
    });
}
