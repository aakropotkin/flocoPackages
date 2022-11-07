{

  inputs.packument.url   = "https://registry.npmjs.org/amqp-connection-manager?rev=91-53b7ef5e05d901968a23467bbccebc25";
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
    ident = "amqp-connection-manager";
    ldir  = "info/unscoped/a/amqp-connection-manager";
    inherit packument fetchInfo;
  } // latest';

}
