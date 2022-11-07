{

  inputs.packument.url   = "https://registry.npmjs.org/morgan?rev=550-770d1a338c99bc929314dafc25c5ba69";
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
    scope = null;
    ident = "morgan";
    ldir  = "info/unscoped/m/morgan";
    inherit packument fetchInfo;
  } // latest';

}
