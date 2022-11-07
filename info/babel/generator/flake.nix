{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/generator?rev=168-021354775fd9151b06f614ad0d99ca12";
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
    ident = "@babel/generator";
    ldir  = "info/babel/generator";
    inherit packument fetchInfo;
  } // latest';

}
