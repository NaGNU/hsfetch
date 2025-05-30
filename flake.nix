{
  description = "hsfetch - A Haskell system info tool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hsfetch = pkgs.haskellPackages.callPackage ./default.nix {};
      in {
        packages.default = hsfetch;
        
        apps.default = {
          type = "app";
          program = "${hsfetch}/bin/hsfetch";
        };

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            haskellPackages.ghc
            cabal-install
            haskell-language-server
          ];
        };
      }
    );
}
