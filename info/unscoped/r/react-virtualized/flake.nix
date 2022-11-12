{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-virtualized?_rev=330-e7631ddb4fb86cf1b4cfdc64378d83e0";
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
    ident = "react-virtualized";
    ldir  = "info/unscoped/r/react-virtualized";
    inherit packument fetchInfo;
  } // latest';

}
