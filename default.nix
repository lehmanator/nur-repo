# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  example-package = pkgs.callPackage ./pkgs/example-package { };

  firefox-gnome-theme = pkgs.callPackage ./pkgs/firefox-gnome-theme { };
  arkenfox = pkgs.callPackage ./pkgs/arkenfox { };
  #librewolf = pkgs.callPackage ./pkgs/librewolf { };

  #mutter-performance = pkgs.callPackage ./pkgs/mutter-performance { };
  #mutter-fractional-scaling = pkgs.callPackage ./pkgs/mutter-fractional-scaling { };
  #mutter-improved = pkgs.callPackage ./pkgs/mutter-improved { };
  
  #gnome-settings-center-fractional-scaling = pkgs.callPackage ./pkgs/gnome-settings-center-fractional-scaling { };

  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
