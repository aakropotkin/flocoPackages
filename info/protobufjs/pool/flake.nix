{

  inputs.packument.url   = "https://registry.npmjs.org/@protobufjs/pool?rev=10-6fc7bf69ed5fe73eaffeda7e0774e919";
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
    scope = "@protobufjs";
    ident = "@protobufjs/pool";
    ldir  = "info/protobufjs/pool";
    inherit packument fetchInfo;
  } // latest';

}
