{

  inputs.packument.url   = "https://registry.npmjs.org/json-loader?rev=80-828b5690ba2c63f7ccef67963572a8de";
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
    ident = "json-loader";
    ldir  = "info/unscoped/j/json-loader";
    inherit packument fetchInfo;
  } // latest';

}
