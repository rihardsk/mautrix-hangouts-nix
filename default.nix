{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell hasAttr optionalString;

  customPackages = self: super:
    let callPackage = pkgs.newScope self;
    in {
      hangups = callPackage ./hangups-nix2 {};
      readlike = callPackage ./readlike-nix {};
      ReParser = callPackage ./reparser-nix {};
      mautrix-hangouts = callPackage ./mautrix-hangouts-nix {};
      # these have incompatible versions in nixpkgs
      ConfigArgParse_0-11 = callPackage ./configargparse-nix {};
      MechanicalSoup_0-6 = callPackage ./mechanicalsoup-nix {};
      urwid_1-3-1 = callPackage ./urwid-nix {};
      protobuf_3-6-1 = callPackage ./protobuf-nix {};
    };

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
    overrides = customPackages;
  };
in
pythonPackages.mautrix-hangouts
