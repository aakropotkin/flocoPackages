{ floco           ? builtins.getFlake "github:aameen-tulip/at-node-nix"
, system          ? builtins.currentSystem
, lib             ? floco.lib
, pkgsFor         ? floco.legacyPackages.${system}
, buildEnv        ? pkgsFor.buildEnv
, writeTextDir    ? pkgsFor.writeTextDir
# { scope -> { bname -> registry attrs } }
, targets         ? lib.importJSON ./npmjs.json
, scope           ? "_"
, flakeRegistries ? null
}: let
  writeRegistry = ident: reg:
    writeTextDir "${ident}.json" ( builtins.toJSON reg );
  genReg = ident: writeRegistry ident ( lib.libreg.flakeRegistryFromNpm ident );
  regsForScope = scope: bnames:
    map ( i: genReg ( if scope == "_" then i else "@${scope}/${i}" ) ) bnames;
  regs = if flakeRegistries != null then flakeRegistries else
         builtins.mapAttrs regsForScope targets;
in buildEnv {
  name = "registry-tree";
  paths = regs.${scope};
}
