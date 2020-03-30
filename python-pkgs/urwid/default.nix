
{ lib
, stdenv
, fetchurl
, buildPythonPackage
}:
buildPythonPackage {
  name = "urwid-1.3.1";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/85/5d/9317d75b7488c335b86bd9559ca03a2a023ed3413d0e8bfe18bea76f24be/urwid-1.3.1.tar.gz"; sha256 = "cfcec03e36de25a1073e2e35c2c7b0cc6969b85745715c3a025a31d9786896a1"; };
  doCheck = false;
  propagatedBuildInputs = [ ];
  meta = with lib; {
    homepage = "http://urwid.org/";
    license = licenses.lgpl2;
    description = "A full-featured console (xterm et al.) user interface library";
  };
}
