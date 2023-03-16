{
  description = "Felix' Exercism OCaml solutions";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        myDevTools = [
          pkgs.ocaml
          pkgs.dune_3
          pkgs.ocamlPackages.ocaml
          pkgs.ocamlPackages.base
          pkgs.ocamlPackages.findlib
          pkgs.ocamlPackages.ounit2
        ];

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = myDevTools;
        };
      });
    }

