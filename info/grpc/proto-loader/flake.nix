{

  inputs.packument.url   = "https://registry.npmjs.org/@grpc/proto-loader?rev=50-61a71fec82794e7fc18cb6e3099bfc56";
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
    scope = "@grpc";
    ident = "@grpc/proto-loader";
    ldir  = "info/grpc/proto-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
