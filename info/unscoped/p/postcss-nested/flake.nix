{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-nested?_rev=52-7e544a5f450de584d796aeb35993476f";
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
    ident = "postcss-nested";
    ldir  = "info/unscoped/p/postcss-nested";
    inherit packument fetchInfo;
  } // latest';

}
