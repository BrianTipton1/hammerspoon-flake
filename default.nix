{ pkgs, name, version, stdenv, fetchurl, ... }:

stdenv.mkDerivation {
  pname = name;
  version = version;
  src = fetchurl {
    url =
      "https://github.com/Hammerspoon/hammerspoon/releases/download/${version}/Hammerspoon-${version}.zip";
    sha256 = "sha256-bc/IB8fOxpLK87GMNsweo69rn0Jpm03yd3NECOTgc5k=";
  };
  sourceRoot = "${name}.app";
  nativeBuildInputs = with pkgs; [ undmg unzip ];
  installPhase = ''
    mkdir -p $out/Applications/
    cp -R . $out/Applications/Hammerspoon.app
  '';
}
