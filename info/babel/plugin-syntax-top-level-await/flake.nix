{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-top-level-await?rev=15-5a50319adf457cf128b8c7f8f78a39e8";
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
    scope = "@babel";
    ident = "@babel/plugin-syntax-top-level-await";
    ldir  = "info/babel/plugin-syntax-top-level-await";
    inherit packument fetchInfo;
  } // latest';

}
