{ lib
, stdenv
, fetchurl
, buildPythonPackage
}:
buildPythonPackage {
  name = "ConfigArgParse-0.11.0";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/45/87/a815edcdc867de0964e5f1efef6db956bbb6fe77dbe3f273f2aeab39cbe8/ConfigArgParse-0.11.0.tar.gz"; sha256 = "6c8ae823f6844b055f2a3aa9b51f568ed3bd7e5be9fba63abcaf4bdd38a0ac89"; };
  doCheck = false;
  propagatedBuildInputs = [ ];
  meta = with lib; {
    homepage = "https://github.com/bw2/ConfigArgParse";
    license = licenses.mit;
    description = "A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables.";
  };
}
