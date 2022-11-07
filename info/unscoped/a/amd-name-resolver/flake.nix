{

  inputs.packument.url   = "https://registry.npmjs.org/amd-name-resolver?rev=19-8da78b0f6fc2d010887ac6a1677e94e7";
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
    ident = "amd-name-resolver";
    ldir  = "info/unscoped/a/amd-name-resolver";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
