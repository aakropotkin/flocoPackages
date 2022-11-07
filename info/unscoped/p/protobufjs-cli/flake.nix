{

  inputs.packument.url   = "https://registry.npmjs.org/protobufjs-cli?rev=7-c7a58ec16244c7f61706be086a8a0afa";
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
    ident = "protobufjs-cli";
    ldir  = "info/unscoped/p/protobufjs-cli";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
