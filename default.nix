{ pkgs ? import <nixpkgs> {}
}:

(import ./setup.nix {}).targetPython.pkgs.mautrix-hangouts
