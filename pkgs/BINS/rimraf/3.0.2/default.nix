{ lib
, ident
, version
, mkBinPackage
, src
, flocoPackages
, keysTree ? lib.importJSON ./tree.json
}: mkBinPackage {
  inherit ident version src;
  globalNmDirCmd = let
    addMod = to: from: "pjsAddMod ${flocoPackages.${from}} ${to};";
    lines  = builtins.attrValues ( builtins.mapAttrs addMod keysTree );
  in "\n" + ( builtins.concatStringsSep "\n" lines ) + "\n";
}
