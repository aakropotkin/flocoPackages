#{ floco           ? builtins.getFlake "github:aameen-tulip/at-node-nix"
{ floco           ? builtins.getFlake "l-at-node-nix"
, system          ? builtins.currentSystem
, lib             ? floco.lib
, pkgsFor         ? floco.legacyPackages.${system}
, buildEnv        ? pkgsFor.buildEnv
, writeTextDir    ? pkgsFor.writeTextDir
# { scope -> { bname -> registry attrs } }
, targets         ? lib.importJSON ./npmjs.json
, scope           ? "UNSCOPED"
, flakeRegistries ? null
, timestamp       ? toString builtins.currentTime
}: let

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

  writeRegistry = ident: reg:
    writeTextDir ( outfileFor ident ) ( builtins.toJSON reg );

  genReg = ident: let
    tr = lib.libreg.flakeRegistryFromPackuments {
      # Indicating the registry improves lookup speed.
      registry       = "https://registry.npmjs.org";
      outputTreelock = true;
      inherit ident;
    };
  in writeRegistry ident tr;

  regsForScope = scope': bnames:
    map ( b: genReg "${scopedirFor scope'}${b}" ) bnames;
  regs = if flakeRegistries != null then flakeRegistries else
         builtins.mapAttrs regsForScope targets;

  # Now we stope treating "scope" as an arg.
  timestampFile = writeTextDir "${localdirFor scope}.timestamp"
                               ( toString timestamp );
in buildEnv {
  name = if isNs scope then "registry-tree-unscoped"
         else "registry-tree-${scope}";
  paths = regs.${attrFor scope} ++ [timestampFile];
}
