{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-json-strings?rev=46-5ca5ed30a7860e0e2ce63fe6c6456efc";
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
    ident = "@babel/plugin-proposal-json-strings";
    ldir  = "info/babel/plugin-proposal-json-strings";
    inherit packument fetchInfo;
  } // latest';

}
