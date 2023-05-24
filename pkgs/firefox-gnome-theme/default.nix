{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
}@args:
let
  buildFirefoxTheme = lib.mkOverridable ({ 
    stdenv ? args.stdenv,
    fetchurl ? args.fetchurl,
    fetchgit ? args.fetchgit,
    pname, version, themeId, url, sha256, meta, ...
  }: stdenv.mkDerivation {
    name = "${pname}-${version}";
    inherit meta;
    src = fetchurl { inherit url sha256; };
    preferLocalBuild = true;
    allowSubstitutes = true;
    buildCommand = ''
    '';

  });
in

stdenv.mkDerivation rec {
  name = "firefox-gnome-theme-${version}";
  version = "v111"; # "1.0";
  src = ./.;
  buildPhase = "echo echo Hello World > example";
  installPhase = "install -Dm755 example $out";
}
