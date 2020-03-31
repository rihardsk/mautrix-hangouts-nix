{ pkgs
, lib
, aiohttp
, alembic
, CommonMark
, hangups
, mautrix
, python_magic
, ruamel_yaml
, sqlalchemy
, mautrix-hangouts
, buildPythonPackage
, pythonOlder
, fetchPypi
, fetchFromGitHub
}:

let gitDetails = builtins.fromJSON (builtins.readFile ./mautrix-hangouts.json );
in
buildPythonPackage rec {
  pname = "mautrix-hangouts";
  version = "0.1.0.dev8";
  disabled = pythonOlder "3.6";
  # format = "wheel";

  # src = fetchPypi {
  #   inherit version format;
  #   pname = "mautrix_hangouts";
  #   python = "py3";
  #   sha256 = "7701f38a5b0c5bc0684464403d0611fc56558d32e6f4729e99aff7bc392d5bef";
  # };

  src = fetchFromGitHub {
    inherit (gitDetails) owner repo rev sha256;
  };

  # copied from mautrix-telegram, it seems it isn't doing anything here
  postPatch = ''
    sed -i -e '/alembic>/d' setup.py
  '';

  doCheck = false;
  propagatedBuildInputs = [
    aiohttp
    alembic
    CommonMark
    hangups
    mautrix
    python_magic
    ruamel_yaml
    sqlalchemy
  ];

  # `alembic` (a database migration tool) is only needed for the initial setup,
  # and not needed during the actual runtime. However `alembic` requires `mautrix-hangouts`
  # in its environment to create a database schema from all models.
  #
  # Hence we need to patch away `alembic` from `mautrix-hangouts` and create an `alembic`
  # which has `mautrix-hangouts` in its environment.
  passthru.alembic = alembic.overrideAttrs (old: {
    propagatedBuildInputs = old.propagatedBuildInputs ++ [
      mautrix-hangouts
    ];
  });
}
