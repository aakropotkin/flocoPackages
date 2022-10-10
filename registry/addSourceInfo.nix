# ---------------------------------------------------------------------------- #

{ floco           ? builtins.getFlake "github:aameen-tulip/at-node-nix"
, system          ? builtins.currentSystem
, lib             ? floco.lib
, pkgsFor         ? floco.legacyPackages.${system}
, buildEnv        ? pkgsFor.buildEnv
, targets         ? lib.importJSON ./npmjs.json
, writeTextDir    ? pkgsFor.writeTextDir
# { scope -> { bname -> registry attrs } }
}: let


# ---------------------------------------------------------------------------- #

  isNs = x: builtins.elem x ["UNSCOPED" "unscoped" "" "unscoped/" "."];

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
  in if isNs s then "UNSCOPED" else if m == null then s else builtins.head m;


# ---------------------------------------------------------------------------- #

  readTreelockFor = scope: bname: let
    ldir = if scope == "UNSCOPED" then "unscoped" else "@${scope}";
  in lib.importJSON "${toString ./.}/${ldir}/${bname}.json";

  readTreelocksForScope = scope: bnames:
    builtins.listToAttrs ( map ( name: {
      inherit name;
      value = readTreelockFor scope name;
    } ) bnames );

  treelocks = builtins.mapAttrs readTreelocksForScope targets;


# ---------------------------------------------------------------------------- #

  addSourceInfoToTreelock = tlock:
    tlock // {
      trees = map ( { from, to, ... } @ ent:
        if ent ? sourceInfo then ent else ent // {
          sourceInfo = removeAttrs ( builtins.fetchTree to ) ["outPath"];
        } ) tlock.trees;
    };

  addSourceInfoToScope = scope:
    builtins.mapAttrs ( _: addSourceInfoToTreelock );

  sitreelocks = builtins.mapAttrs addSourceInfoToScope treelocks;

  writeTlock = scope: bname: let
    nixFilename = if scope == "UNSCOPED" then "unscoped--${bname}"
                                         else "${scope}--${bname}";
  in builtins.toFile nixFilename
                     ( builtins.toJSON sitreelocks.${scope}.${bname} );

  dumpScope = scope:
    builtins.foldl' ( acc: bname: let
      odir = if scope == "UNSCOPED" then "unscoped/" else "@${scope}/";
    in acc + ''
      cat ${writeTlock scope bname} > ${odir}${bname}.json;
    '' ) "" ( builtins.attrNames sitreelocks.${scope} );

  siTreeDumps = let
    keeps = lib.filterAttrs ( scope: v: v != treelocks.${scope} ) sitreelocks;
  in map dumpScope ( builtins.attrNames keeps );



# ---------------------------------------------------------------------------- #

in {
  inherit
    sitreelocks
    siTreeDumps
    addSourceInfoToTreelock
    addSourceInfoToScope
    readTreelockFor
    readTreelocksForScope
    treelocks
    writeTlock
    dumpScope
  ;
}


# ---------------------------------------------------------------------------- #
