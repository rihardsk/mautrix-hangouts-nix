{ pkgs ? import <nixpkgs> {}
}:

(import ./setup.nix {inherit pkgs;}).targetPython.pkgs.mautrix-hangouts
