# Generated by pip2nix 0.8.0.dev1
# Adjust to your needs, e.g. to provide C libraries.

{ pkgs, basePythonPackages }:

self: super: {

  # Example adjustment for lxml: It needs a few C libraries
  #
  lxml = super.lxml.override (attrs: {
    buildInputs = with self; [
      pkgs.libxml2
      pkgs.libxslt
    ];
    nativeBuildInputs = with self; [
      pkgs.libxml2.dev
      pkgs.libxslt.dev
    ];
  });

  # python-magic = super.python-magic.override (attrs: {
  #   postPatch = ''
  #     substituteInPlace magic.py --replace "ctypes.util.find_library('magic')" "'${pkgs.file}/lib/libmagic${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}'"
  #   '';
  # });

  # Applying recurseIntoAttrs to an attribute set will cause nix-env to look
  # inside the set for derivations. This is needed so that mautrix-hangouts.alembic
  # (which got there via passthru) is built
  mautrix-hangouts = pkgs.recurseIntoAttrs (super.mautrix-hangouts.override (attrs: {
    # propagatedBuildInputs = with self; attrs.propagatedBuildInputs ++ [
    #   psycopg2
    #   setuptools  # needed because mautrix-hangouts imports pkg_resources somewhere within
    # ];
    propagatedBuildInputs = [
      self.psycopg2
      self.setuptools  # needed because mautrix-hangouts imports pkg_resources somewhere within
      self."SQLAlchemy"
      self."aiohttp"
      # self."alembic"  # it's weird that, if we leave this in, the passthru elembic doesn't build
      self."commonmark"
      self."hangups"
      self."mautrix"
      # self."python-magic"
      basePythonPackages."python_magic"
      self."ruamel.yaml"
    ];

    patches = [
      ./02-add-entrypoints.patch
    ];

    # `alembic` isn't needed during runtime. See comments below.
    postPatch = ''
      sed -i -e '/alembic>/d' requirements.txt
    '';

    # `alembic` (a database migration tool) is only needed for the initial setup,
    # and not needed during the actual runtime. However `alembic` requires `mautrix-hangouts`
    # in its environment to create a database schema from all models.
    #
    # Hence we need to patch away `alembic` from `mautrix-hangouts` and create an `alembic`
    # which has `mautrix-hangouts` in its environment.
    passthru.alembic = self.alembic.overrideAttrs (old: {
      propagatedBuildInputs = with self; old.propagatedBuildInputs ++ [
        mautrix-hangouts
        psycopg2
      ];
    });
  }));

  # Common needs

  # setuptools - avoid that we end up in a recursion
  # inherit (basePythonPackages) setuptools;

}
