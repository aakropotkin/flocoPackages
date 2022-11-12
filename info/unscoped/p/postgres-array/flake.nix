{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postgres-array?_rev=10-b5109466c84630b1fe18bf98f027e831";
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
    ident = "postgres-array";
    ldir  = "info/unscoped/p/postgres-array";
    inherit packument fetchInfo;
  } // latest';

}
