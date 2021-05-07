# Scaffold generated by pip2nix 0.8.0.dev1
# + some modifications have been added so support the changes that the Python
# infrastructure in nixpkgs-unstable has gone through

{ pkgs ? (import <nixpkgs> {})
, pythonPackages ? "python38Packages"
}:

let
  inherit (pkgs.lib) fix composeExtensions;
  basePythonPackages = with builtins; if isAttrs pythonPackages
    then pythonPackages
    else getAttr pythonPackages pkgs;

  # NOTE: As of some recent nixpgs-unstable version, this is broken.
  # There's a workaround at the bottem that's using
  # basePythonPackages.pkgs.override instead
  #
  # Works with the new python-packages, still can fallback to the old
  # variant.
  # basePythonPackagesUnfix = basePythonPackages.__unfix__ or (
  #   self: basePythonPackages.override (a: { inherit self; }));

  elem = builtins.elem;
  basename = path: with pkgs.lib; last (splitString "/" path);
  startsWith = prefix: full: let
    actualPrefix = builtins.substring 0 (builtins.stringLength prefix) full;
  in actualPrefix == prefix;

  src-filter = path: type: with pkgs.lib;
    let
      ext = last (splitString "." path);
    in
      !elem (basename path) [".hg" ".git" "__pycache__" ".eggs"] &&
      !elem ext ["egg-info" "pyc"] &&
      !startsWith "result" path;

  pythonPackagesGenerated = import ./python-packages.nix {
    inherit pkgs;
    inherit (pkgs) fetchurl fetchgit fetchhg;
  };

  pythonPackagesOverrides = import ./python-packages-overrides.nix {
    inherit basePythonPackages pkgs;
  };

  pythonPackagesLocalOverrides = self: super: {
  };

  composedOverrides =
    (composeExtensions pythonPackagesLocalOverrides
                      (composeExtensions pythonPackagesOverrides
                                         pythonPackagesGenerated));
  myPythonPackages = basePythonPackages.python.override { packageOverrides = composedOverrides; };

in myPythonPackages.pkgs.mautrix-hangouts
