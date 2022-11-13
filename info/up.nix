{ util      ? import ../util {}
, lib       ? ( builtins.getFlake "at-node-nix" ).lib
, allFlakes ? import ./allFlakes.nix {}
, scope
}: let

  bdirs = builtins.attrValues ( lib.filterAttrs ( k: _:
    lib.hasPrefix "${toString ./.}/scope" k ) allFlakes
  );

  updated = builtins.foldl' ( acc: x: acc // {
    ${scope} = ( acc.${scope} or {} ) // {
      ${baseNameOf x.ident} = {
        rev = ( lib.libreg.importFetchPackument { ident = x.ident; } )._rev or
              "null";
        "fetchInfo.json" =
          builtins.toJSON ( util.genFetchInfo { ident = x.ident; } );
      };
    };
  } ) {} bdirs;

in assert ( scope != "unscoped" ) && ( scope != null );
   updated
