{

  inputs.packument.url   = "https://registry.npmjs.org/@formatjs/ecma402-abstract?rev=52-dff65a08aee6612a8c40896188703a4c";
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
    scope = "@formatjs";
    ident = "@formatjs/ecma402-abstract";
    ldir  = "info/formatjs/ecma402-abstract";
    inherit packument fetchInfo;
  } // latest';

}
