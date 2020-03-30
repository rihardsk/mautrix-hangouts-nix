{ lib, buildPythonPackage, fetchurl }:
buildPythonPackage {
  name = "readlike-0.1.2";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/03/a4/8267929e370c0167b138df47ee120fc79f820b2f4d0791f611d934921552/readlike-0.1.2.tar.gz"; sha256 = "08645493a24eecbcad70a5ed7fbf1a3820ba5e57e9690297edc485c2992f66b2"; };
  doCheck = false;
  propagatedBuildInputs = [ ];
  meta = with lib; {
    homepage = "http://jangler.info/code/readlike";
    license = licenses.mit;
    description = "GNU Readline-like line editing module";
  };
}
