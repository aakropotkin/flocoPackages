{ floco    ? builtins.getFlake "github:aameen-tulip/at-node-nix"
#, registry ? floco.lib.libreg.registryForScope ident
, registry ? "https://registry.npmjs.org"
, ident
, old ? if builtins.pathExists ./npmjs.json
        then builtins.fromJSON ( builtins.readFile ./npmjs.json )
        else {}
}: let
  inherit (floco) lib;
  packumenter = lib.libreg.packumenter // { inherit registry; };
  packs       = ( lib.libreg.packumentClosure' packumenter ident ).packuments;
  renamed     = lib.remapKeysWith ( k:
    if k == "." then "unscoped" else lib.yank "@(.*)" k
  ) ( builtins.groupBy dirOf ( builtins.attrNames packs ) );
  bare = builtins.mapAttrs ( k: v:
    lib.unique ( ( map baseNameOf v ) ++ ( old.${k} or [] ) )
  ) renamed;
in old // bare

# Regenerates `npmjs.json' adding a package's closure:
#   nix eval --impure --json -f ./closure-for.nix --apply '
#     f: f { ident = "@babel/core"; }
#   ' 2>/dev/null;
