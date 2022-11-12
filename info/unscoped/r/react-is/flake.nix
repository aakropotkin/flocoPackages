{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-is?_rev=1164-45b26194058aaf8926e32a8dc1697953";
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
    ident = "react-is";
    ldir  = "info/unscoped/r/react-is";
    inherit packument fetchInfo;
  } // latest';

}
