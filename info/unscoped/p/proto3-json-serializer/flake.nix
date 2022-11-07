{

  inputs.packument.url   = "https://registry.npmjs.org/proto3-json-serializer?rev=18-9eec449c0fd2e45fcfbd5f40f9e50b83";
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
    ident = "proto3-json-serializer";
    ldir  = "info/unscoped/p/proto3-json-serializer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
