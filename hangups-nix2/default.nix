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
    name = "hangups-0.4.9";
    src = fetchurl { url = "https://files.pythonhosted.org/packages/98/e1/809ced9bbab2356a381465201d02017c12819999c9776dc4bd3293713bc9/hangups-0.4.9.tar.gz"; sha256 = "4a29b30aa1cb3650b825dfc88c8147dc88a83b11226d6875f54192c6508984cb"; };
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
