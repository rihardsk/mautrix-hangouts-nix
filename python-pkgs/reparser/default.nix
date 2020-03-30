{ lib, buildPythonPackage, fetchurl }:
buildPythonPackage {
  name = "ReParser-1.4.3";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/a7/eb/8bd06ddaeb3d5963abb0e2e2f14f2fa975b32fafe198254bfb4106ed9415/ReParser-1.4.3.tar.gz"; sha256 = "e69caf58a29d6e04723f6a7a456d304b7acfcf413957dafcd90ee49eccc2d15a"; };
  doCheck = false;
  propagatedBuildInputs = [ ];
  meta = with lib; {
    homepage = "https://github.com/xmikos/reparser";
    license = licenses.mit;
    description = "Simple regex-based lexer/parser for inline markup";
  };
}
