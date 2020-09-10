{ lib
, stdenv
, fetchurl
, buildPythonPackage
, ConfigArgParse_0-11
, MechanicalSoup_0-6
, ReParser
, aiohttp
, appdirs
, async-timeout
, protobuf_3-6-1
, readlike
, requests
, urwid_1-3-1
}:
buildPythonPackage {
    name = "hangups-0.4.11";
    src = fetchurl { url = "https://files.pythonhosted.org/packages/03/01/9285c437220076cef1e5448817dabcb81cb9a2d35065d313e51a63630faa/hangups-0.4.11.tar.gz"; sha256 = "db530cd7352c3fef4513bce38f07d19b79180b3aefed71afd9f369bab7cab498"; };
    doCheck = false;
    propagatedBuildInputs = [
      ConfigArgParse_0-11
      MechanicalSoup_0-6
      ReParser
      aiohttp
      appdirs
      async-timeout
      protobuf_3-6-1
      readlike
      requests
      urwid_1-3-1
    ];
    meta = with lib; {
      homepage = "https://github.com/tdryer/hangups";
      license = licenses.mit;
      description = "the first third-party instant messaging client for Google Hangouts";
    };
}
