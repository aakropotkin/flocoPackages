{

  inputs.packument.url   = "https://registry.npmjs.org/protobufjs?rev=451-e7f98377fee1c5ae5b25bf21303d9a58";
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
    ident = "protobufjs";
    ldir  = "info/unscoped/p/protobufjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
