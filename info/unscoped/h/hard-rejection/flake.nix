{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hard-rejection?_rev=7-9f3f68ac34604e1ae058f950437cf0ba";
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
    ident = "hard-rejection";
    ldir  = "info/unscoped/h/hard-rejection";
    inherit packument fetchInfo;
  } // latest';

}
