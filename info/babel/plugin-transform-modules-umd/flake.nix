{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-modules-umd?rev=85-4fa12207a408baa422325a4858e43fc9";
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
    ident = "@babel/plugin-transform-modules-umd";
    ldir  = "info/babel/plugin-transform-modules-umd";
    inherit packument fetchInfo;
  } // latest';

}
