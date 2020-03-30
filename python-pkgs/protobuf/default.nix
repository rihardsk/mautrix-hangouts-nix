{ lib
, stdenv
, fetchurl
, buildPythonPackage
, six
}:
buildPythonPackage {
  name = "protobuf-3.6.1";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/1b/90/f531329e628ff34aee79b0b9523196eb7b5b6b398f112bb0c03b24ab1973/protobuf-3.6.1.tar.gz"; sha256 = "1489b376b0f364bcc6f89519718c057eb191d7ad6f1b395ffd93d1aa45587811"; };
  doCheck = true;
  propagatedBuildInputs = [
    six
  ];
  meta = with lib; {
    homepage = "https://developers.google.com/protocol-buffers/";
    license = "3-Clause BSD License";
    description = "Protocol Buffers";
  };
}
