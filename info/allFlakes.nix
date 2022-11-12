{ at-node-nix ? builtins.getFlake "at-node-nix"
, lib         ? at-node-nix.lib
, system      ? builtins.currentSystem
, pkgsFor     ? at-node-nix.legacyPackages.${system}
, registry    ? lib.importJSON ./info.json
}: let
  allDirs   = lib.libfs.listDirsRecursive ( toString ./. );
  allFlakes = let
    proc = acc: dir:
      if ! ( builtins.pathExists "${dir}/flake.nix" ) then acc else
      acc // { ${dir} = builtins.getFlake dir; };
  in builtins.foldl' proc {} allDirs;
in allFlakes
