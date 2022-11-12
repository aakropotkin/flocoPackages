{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/prompts?_rev=53-ca16f3093f6560fd924e910625c5b8d0";
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
    ident = "prompts";
    ldir  = "info/unscoped/p/prompts";
    inherit packument fetchInfo;
  } // latest';

}
