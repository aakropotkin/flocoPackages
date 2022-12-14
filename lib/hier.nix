# ============================================================================ #
#
# 
#
# ---------------------------------------------------------------------------- #

{ lib }: let

# ---------------------------------------------------------------------------- #

  # Convert a hierarchy of `{ <DSCOPE>: { <BNAME>: [<VERSION>...] } }'
  # to a flat list of package keys: `@foo/bar/1.0.0'.
  hierToKeys = hier: let
    toKey = ident: version: "${ident}/${version}";
    remap = scope: bname:
      if scope == "unscoped" then bname else "@${scope}/${bname}";
    remapScope   = scope: lib.libattrs.remapKeysWith ( remap scope );
    keyVersions  = ident: map ( toKey ident );
    mergedScopes = lib.joinAttrs ( builtins.mapAttrs remapScope hier );
    versioned    = builtins.mapAttrs keyVersions mergedScopes;
  in builtins.concatLists ( builtins.attrValues versioned );


  # For a set of `{ <SCOPE>: [<BNAME>...] }'.
  scopeBnamesToIdents = hier: let
    addScopeTo = scope: bnames:
      if scope == "unscoped" then bnames else
      map ( b: "@${scope}/${b}" ) bnames;
    identsByScope = builtins.mapAttrs addScopeTo hier;
  in builtins.concatLists ( builtins.attrValues identsByScope );


# ---------------------------------------------------------------------------- #

in {
  inherit
    hierToKeys
    scopeBnamesToIdents
  ;
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
