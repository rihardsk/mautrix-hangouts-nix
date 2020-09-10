{ pkgs ? import <nixpkgs> {}
}:

let
  customPackages = self: super:
    let callPackage = pkgs.newScope self;
    in {
      hangups = callPackage ./python-pkgs/hangups {};
      readlike = callPackage ./python-pkgs/readlike {};
      ReParser = callPackage ./python-pkgs/reparser {};
      # Applying recurseIntoAttrs to an attribute set will cause nix-env to look
      # inside the set for derivations. This is needed so that mautrix-hangouts.alembic
      # (which got there via passthru) is built
      mautrix-hangouts = pkgs.recurseIntoAttrs (callPackage ./python-pkgs/mautrix-hangouts {});
      # these have incompatible versions in nixpkgs
      ConfigArgParse_0-11 = callPackage ./python-pkgs/configargparse {};
      MechanicalSoup_0-6 = callPackage ./python-pkgs/mechanicalsoup {};
      urwid_1-3-1 = callPackage ./python-pkgs/urwid {};
      protobuf_3-6-1 = callPackage ./python-pkgs/protobuf {};
      mautrix_0-7-1 = callPackage ./python-pkgs/mautrix {};
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
