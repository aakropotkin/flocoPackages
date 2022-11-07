{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-export-namespace-from?rev=59-7bd8725680027db9a9b81edb1363791b";
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
    ident = "@babel/plugin-syntax-export-namespace-from";
    ldir  = "info/babel/plugin-syntax-export-namespace-from";
    inherit packument fetchInfo;
  } // latest';

}
