{ nixpkgs     ? builtins.getFlake "nixpkgs"
, at-node-nix ? builtins.getFlake "at-node-nix"
, libOv       ? import ../../lib/overlay.lib.nix
, lib         ? at-node-nix.lib.extend libOv
, depOv       ? at-node-nix.overlays.default
, coreOv      ? import ../../overlay.nix
, ov          ? nixpkgs.lib.composeExtensions depOv coreOv
, system      ? builtins.currentSystem
, pkgsFor     ? nixpkgs.legacyPackages.${system}.extend ov
}: let

  simpleOv   = import ./overlay.nix;
  simplePkgs = pkgsFor.extend simpleOv;

  flocoPkgs   = simplePkgs.flocoPackages;
  noInternals = removeAttrs flocoPkgs [
    "extend"
    "__unfix__"
    "__internalSimple"
    "__internalBins"
    "__internalInst"
    "__internalGyp"
    "__internalInfo"
    "__internal"
  ];

  flocoPkgsHier = let
    proc = acc: key: let
      m = builtins.match "(@([^@/]+)/)?([^@/]+)/(.*)" key;
      version = builtins.elemAt m 3;
      bname   = builtins.elemAt m 2;
      scope'  = builtins.elemAt m 1;
      scope   = if scope' == null then "unscoped" else scope';
      fl      = lib.toLower ( builtins.substring 0 1 bname );
      addB    = prev: prev // {
        ${bname} = ( prev.${bname} or {} ) // {
          ${version} = flocoPkgs.${key};
        };
      };
    in if m == null then throw "bad key: '${key}'" else acc // {
      ${scope} = let
        prevS = acc.${scope} or {};
        prev  = if scope' == null then prevS.${fl} or {}
                                  else prevS;
      in if scope' == null then prevS // { ${fl} = addB prev; }
                           else prevS // ( addB prev );
    };
  in builtins.foldl' proc {} ( builtins.attrNames noInternals );

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
