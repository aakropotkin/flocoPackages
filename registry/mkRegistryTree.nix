{ floco           ? builtins.getFlake "github:aameen-tulip/at-node-nix"
, system          ? builtins.currentSystem
, lib             ? floco.lib
, pkgsFor         ? floco.legacyPackages.${system}
, buildEnv        ? pkgsFor.buildEnv
, writeTextDir    ? pkgsFor.writeTextDir
# Attrs { ident -> registry attrs }
, targets         ? lib.importJSON ./npmjs.json
, scope           ? "_"
, flakeRegistries ? null
}: let
  writeRegistry = ident: reg: writeTextDir ident ( builtins.toJSON reg );
  genReg = ident: writeRegistry ident ( lib.libreg.flakeRegistryFromNpm ident );
  regsForScope = scope: idents:
    map ( i: genReg ( if scope == "_" then i else "@${scope}/${i}" ) ) idents;
  regs = if flakeRegistries != null then flakeRegistries else
         builtins.mapAttrs regsForScope targets;
in buildEnv {
  name = "registry-tree";
  paths = regs.${scope};
}
