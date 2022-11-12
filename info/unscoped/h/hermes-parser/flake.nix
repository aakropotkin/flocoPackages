{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hermes-parser?_rev=21-c3b6804ec86a6fd3bd6340500d8fbe04";
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
    ident = "hermes-parser";
    ldir  = "info/unscoped/h/hermes-parser";
    inherit packument fetchInfo;
  } // latest';

}
