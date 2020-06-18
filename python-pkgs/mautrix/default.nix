{ lib
, stdenv
, fetchurl
, buildPythonPackage
, aiohttp
, attrs
}:
buildPythonPackage {
  name = "mautrix-0.5.7";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/41/b3/bbf71ab2eb0fa6a8bbdcec8094c6c3b8d86d62808011ed2f171aa7c1e006/mautrix-0.5.7.tar.gz"; sha256 = "3311a6461d13b2dd5933e602967e4762e9ec32cab7afec1bf153b93493acfe33"; };
  doCheck = false;
  propagatedBuildInputs = [
    aiohttp
    attrs
  ];
}
