{ lib }: let

  # Convert a hierarchy of `{ <DSCOPE>: { <BNAME>: [<VERSION>...] } }'
  # to a flat list of package keys: `@foo/bar/1.0.0'.
  hierToKeys = hier:
    builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( ident: map ( version: "${ident}/${version}" ) ) ( lib.joinAttrs ( builtins.mapAttrs ( scope: lib.libattrs.remapKeysWith ( bname: if scope == "unscoped" then bname else "@${scope}/${bname}" ) ) hier ) ) ) );

in {
  inherit
    hierToKey
  ;
}
