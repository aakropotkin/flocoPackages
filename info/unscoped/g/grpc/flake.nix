{

  inputs.packument.url   = "https://registry.npmjs.org/grpc?rev=239-25dc4fac3b4e83949d5e56a8e6b37bbf";
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
    ident = "grpc";
    ldir  = "info/unscoped/g/grpc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
