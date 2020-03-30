{ lib
, stdenv
, fetchurl
, buildPythonPackage
, beautifulsoup4
, requests
, six
}:
buildPythonPackage {
  name = "MechanicalSoup-0.6.0";
  src = fetchurl { url = "https://files.pythonhosted.org/packages/50/ae/015244f26e2603b15f796fdd42aa99d20c9a395606900909e119a971fa8e/MechanicalSoup-0.6.0.zip"; sha256 = "e2b950c11fc5414d246b3c82024272d7ba729ab1f90534fc65fc445a63b7434d"; };
  doCheck = false;
  propagatedBuildInputs = [
    beautifulsoup4
    requests
    six
  ];
  meta = with lib; {
    homepage = "https://github.com/hickford/MechanicalSoup";
    license = licenses.mit;
    description = "A Python library for automating interaction with websites";
  };
}
