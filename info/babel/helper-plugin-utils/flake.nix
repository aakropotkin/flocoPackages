{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-plugin-utils?rev=56-0558a13703b42af9038c8bf33bee5da5";
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
    ident = "@babel/helper-plugin-utils";
    ldir  = "info/babel/helper-plugin-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
