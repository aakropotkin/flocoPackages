{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stringify-clone?_rev=21-a3dbb77c42fc3a8634650eb4fa951dc4";
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
    ident = "stringify-clone";
    ldir  = "info/unscoped/s/stringify-clone";
    inherit packument fetchInfo;
  } // latest';

}
