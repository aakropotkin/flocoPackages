{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2famqp-connection-manager?_rev=449-58466fa29565b593a1f387201b26a0a7";
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
    scope = "@types";
    ident = "@types/amqp-connection-manager";
    ldir  = "info/types/amqp-connection-manager";
    inherit packument fetchInfo;
  } // latest';

}
