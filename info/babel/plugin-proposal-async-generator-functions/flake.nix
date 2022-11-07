{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-async-generator-functions?rev=102-deb1b96ccaa56aed851e9840b170e22a";
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
    ident = "@babel/plugin-proposal-async-generator-functions";
    ldir  = "info/babel/plugin-proposal-async-generator-functions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
