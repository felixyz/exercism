{
  description = "Felix' Exercism OCaml solutions";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        myDevTools = with pkgs; [
          dune_3
          ocaml
          ocamlPackages.base
          ocamlPackages.findlib
          ocamlPackages.core_kernel
          ocamlPackages.ocaml
          ocamlPackages.ounit2
          ocamlPackages.utop
          ocamlPackages.qcheck
          ocamlformat
          opam
        ];

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = myDevTools;
          shellHook = ''
            eval $(opam env --switch=ocaml-base-compiler)
            echo $(ocaml --version)
          '';
        };
      });
    }

