# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ floco           ? builtins.getFlake "github:aameen-tulip/at-node-nix"
, system          ? builtins.currentSystem
, lib             ? floco.lib.extend ( _: _: import ./lib.nix )
, pkgsFor         ? floco.legacyPackages.${system}
, buildEnv        ? pkgsFor.buildEnv
, targets         ? lib.importJSON ./npmjs.json
, writeTextDir    ? pkgsFor.writeTextDir
# { scope -> { bname -> registry attrs } }
}: let


# ---------------------------------------------------------------------------- #

  isNs = x: builtins.elem x ["unscoped" "" "unscoped/" "."];

  # NOTE: these routines were written to accept `scope' as an argument.
  # However, this file and its associated script intentionally target a single
  # scope at once to limit resource consumption.
  # Pay attention to =scope= vs =scope'=.
  scopedirFor = s: if isNs s then ""          else "@${s}/";
  localdirFor = s: if isNs s then "unscoped/" else "${s}/";

  outfileFor  = i: let
    sb = lib.libparse.parseIdent i;
    ld = if sb.scope == null then "unscoped/" else localdirFor sb.scope;
  in ld + sb.bname + ".json";

  attrFor = s: let
    m = builtins.match "@([^/@]+).*" s;
  in if isNs s then "unscoped" else if m == null then s else builtins.head m;


# ---------------------------------------------------------------------------- #

  treelocks   = builtins.mapAttrs lib.readTreelocksForScope targets;
  sitreelocks = builtins.mapAttrs ( _: lib.addSourceInfoToTreelocks ) treelocks;


# ---------------------------------------------------------------------------- #

  writeTlock = scope: bname:
    builtins.toFile "${scope}--${bname}"
                    ( builtins.toJSON sitreelocks.${scope}.${bname} );

  dumpScope = scope:
    builtins.foldl' ( acc: bname: let
      odir = if scope == "unscoped" then "unscoped/" else "@${scope}/";
    in acc + ''
      cat ${writeTlock scope bname} > ${odir}${bname}.json;
    '' ) "" ( builtins.attrNames sitreelocks.${scope} );

  siTreeDumps = let
    keeps = lib.filterAttrs ( scope: v: v != treelocks.${scope} ) sitreelocks;
  in map dumpScope ( builtins.attrNames keeps );



# ---------------------------------------------------------------------------- #

in {
  inherit
    treelocks
    sitreelocks
    writeTlock
    dumpScope
    siTreeDumps
  ;
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
