{

  inputs.packument.url   = "https://registry.npmjs.org/querystring?rev=78-5a8379d8d77fc673930470b719c2d60c";
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
    ident = "querystring";
    ldir  = "info/unscoped/q/querystring";
    inherit packument fetchInfo;
  } // latest';

}
