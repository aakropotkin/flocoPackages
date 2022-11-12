{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dotenv?_rev=611-11a34d38c8d9c30857c094c7fb4cab60";
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
    ident = "dotenv";
    ldir  = "info/unscoped/d/dotenv";
    inherit packument fetchInfo;
  } // latest';

}
