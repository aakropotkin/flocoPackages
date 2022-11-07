{

  inputs.packument.url   = "https://registry.npmjs.org/plugin-error?rev=15-0c924ab618e8ac9da0d4b3fcaad11bd7";
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
    ident = "plugin-error";
    ldir  = "info/unscoped/p/plugin-error";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
