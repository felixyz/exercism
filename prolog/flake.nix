{
  description = "Felix' Exercism Prolog solutions";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        myDevTools = [
          pkgs.swiProlog
        ];

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = myDevTools;
        };
      });
    }

