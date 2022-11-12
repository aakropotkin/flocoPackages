{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react?_rev=2474-b382009d4155527da4d97571a07f64f8";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "react";
    ldir  = "info/unscoped/r/react";
    inherit packument fetchInfo;
  } // latest';

}
