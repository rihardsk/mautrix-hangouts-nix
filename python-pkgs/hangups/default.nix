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
    src = fetchurl { url = "https://files.pythonhosted.org/packages/10/35/d4323c671db4572bc461f7aca232841076e497edbeae4273b97e9622f275/hangups-0.4.10.tar.gz"; sha256 = "450edf33b9daf7cfb38bc8d310990becea3f791894068cb2e55780c566fa8973"; };
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
