{ lib
, stdenv
, fetchurl
, buildPythonPackage
, aiohttp
, attrs
}:
buildPythonPackage {
  name = "mautrix-0.7.1";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/06/e2/6b84870a67fdd2760277ef0462011b1454686dcae117975350287d515e13/mautrix-0.7.1.tar.gz"; sha256 = "3669af0951a92de0bd35a656f1dc6b108c4161d6fec36282ab2a250be7168ae0"; };
  doCheck = false;
  propagatedBuildInputs = [
    aiohttp
    attrs
  ];
}
