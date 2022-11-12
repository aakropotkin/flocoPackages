{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fecha?_rev=38-ec4163d6e702fbf7f1d425e13818a3cf";
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
    ident = "fecha";
    ldir  = "info/unscoped/f/fecha";
    inherit packument fetchInfo;
  } // latest';

}
