{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hash-sum?_rev=13-fa20b6ae6282396db28605183fc583d0";
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
    ident = "hash-sum";
    ldir  = "info/unscoped/h/hash-sum";
    inherit packument fetchInfo;
  } // latest';

}
