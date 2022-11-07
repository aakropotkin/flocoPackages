{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-dynamic-import?rev=25-935f56c38f794fdcc4b9c4248327d075";
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
    ident = "@babel/plugin-proposal-dynamic-import";
    ldir  = "info/babel/plugin-proposal-dynamic-import";
    inherit packument fetchInfo;
  } // latest';

}
