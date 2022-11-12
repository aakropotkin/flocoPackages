{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-scripts?_rev=302-d562aa1bea3d4d57e67f15702047dc2b";
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
    ident = "react-scripts";
    ldir  = "info/unscoped/r/react-scripts";
    inherit packument fetchInfo;
  } // latest';

}
