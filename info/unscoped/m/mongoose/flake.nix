{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mongoose?_rev=1993-9c79edd8e0c10acc4e3a989df1493560";
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
    ident = "mongoose";
    ldir  = "info/unscoped/m/mongoose";
    inherit packument fetchInfo;
  } // latest';

}
