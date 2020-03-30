{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell hasAttr optionalString;

  customPackages = self: super:
    let callPackage = pkgs.newScope self;
    in {
      hangups = callPackage ./python-pkgs/hangups {};
      readlike = callPackage ./python-pkgs/readlike {};
      ReParser = callPackage ./python-pkgs/reparser {};
      mautrix-hangouts = callPackage ./python-pkgs/mautrix-hangouts {};
      # these have incompatible versions in nixpkgs
      ConfigArgParse_0-11 = callPackage ./python-pkgs/configargparse {};
      MechanicalSoup_0-6 = callPackage ./python-pkgs/mechanicalsoup {};
      urwid_1-3-1 = callPackage ./python-pkgs/urwid {};
      protobuf_3-6-1 = callPackage ./python-pkgs/protobuf {};
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
