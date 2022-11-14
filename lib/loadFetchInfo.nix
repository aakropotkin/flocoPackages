# ============================================================================ #
#
# 
#
# ---------------------------------------------------------------------------- #

{ lib }: let

# ---------------------------------------------------------------------------- #

  infoDir = toString ../info;

# ---------------------------------------------------------------------------- #

  loadFetchInfo' = {
    scope
  , bname
  , shard ? lib.toLower ( builtins.substring 0 1 bname )
  }: let
    ident = if ( scope == null ) || ( scope == "unscoped" ) then bname else
            "@${scope}/${bname}";
    ldir = if ( scope == null ) || ( scope == "unscoped" )
           then infoDir + "/unscoped/${shard}/${bname}"
           else infoDir + "/${scope}/${bname}";
    byVers = lib.importJSON ( ldir + "/fetchInfo.json" );
    proc   = acc: v: acc // { "${ident}/${v}" = byVers.${v}; };
  in builtins.foldl' proc {} ( builtins.attrNames byVers );


# ---------------------------------------------------------------------------- #

  loadFetchInfo = ident: let
    m = builtins.match "(@?([^@/]+)/)?(([^@/])([^@/]+))" ident;
  in loadFetchInfo' {
    scope = builtins.elemAt m 1;
    bname = builtins.elemAt m 2;
    shard = lib.toLower ( builtins.elemAt m 3 );
  };


# ---------------------------------------------------------------------------- #

in {

  inherit
    loadFetchInfo'
    loadFetchInfo
  ;

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
