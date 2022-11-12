{ nixpkgs     ? builtins.getFlake "nixpkgs"
, at-node-nix ? builtins.getFlake "at-node-nix"
, libOv       ? import ../../lib/overlay.lib.nix
, lib         ? at-node-nix.lib.extend libOv
, depOv       ? at-node-nix.overlays.default
, coreOv      ? import ../../overlay.nix
, ov          ? nixpkgs.lib.composeExtensions depOv coreOv
, system      ? builtins.currentSystem
, pkgsFor     ? nixpkgs.legacyPackages.extend ov
}: let

  simpleOv   = import ./overlay.nix;
  simplePkgs = pkgsFor.extend simpleOv;

  flocoPkgs     = simplePkgs.flocoPackages;
  flocoPkgsHier = lib.libattrs.pkgsAsAttrsets ( removeAttrs flocoPkgs [
    "__internalSimple"
    "__internalBins"
    "__internalInst"
    "__internalGyp"
    "__internalInfo"
    "__internal"
  ] );

in {

  infoDir = ../../info;
  dir     = "pkgs/SIMPLE";

  inherit
    nixpkgs at-node-nix
    lib
    pkgsFor simplePkgs flocoPkgs flocoPkgsHier
    system
  ;

  inherit (flocoPkgs) __inernalSimple;

}
