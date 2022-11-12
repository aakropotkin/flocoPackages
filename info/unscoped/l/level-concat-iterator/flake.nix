{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/level-concat-iterator?_rev=7-e33ddc4b6cb8a5ce1c83fd07242e773f";
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
    ident = "level-concat-iterator";
    ldir  = "info/unscoped/l/level-concat-iterator";
    inherit packument fetchInfo;
  } // latest';

}
