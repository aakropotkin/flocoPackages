{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/preset-react?rev=92-76c27dbd148e346572116784ebe12114";
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
    ident = "@babel/preset-react";
    ldir  = "info/babel/preset-react";
    inherit packument fetchInfo;
  } // latest';

}
