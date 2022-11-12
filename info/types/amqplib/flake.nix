{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/amqplib?_rev=560-6b296823843c3fd9f4358a89899f316e";
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
    ident = "@types/amqplib";
    ldir  = "info/types/amqplib";
    inherit packument fetchInfo;
  } // latest';

}
