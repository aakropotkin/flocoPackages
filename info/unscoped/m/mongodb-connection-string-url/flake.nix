{

  inputs.packument.url   = "https://registry.npmjs.org/mongodb-connection-string-url?rev=26-1f8e21d913162df730d74e43a89aa5aa";
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
    ident = "mongodb-connection-string-url";
    ldir  = "info/unscoped/m/mongodb-connection-string-url";
    inherit packument fetchInfo;
  } // latest';

}
