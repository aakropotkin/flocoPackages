{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-parameters?rev=97-5e4c7333ede33af04ac899e27d7c164b";
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
    ident = "@babel/plugin-transform-parameters";
    ldir  = "info/babel/plugin-transform-parameters";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
