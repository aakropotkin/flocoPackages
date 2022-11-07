{

  inputs.packument.url   = "https://registry.npmjs.org/lcov-parse?rev=25-e3e55a410646061783504df5fe0204c0";
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
    ident = "lcov-parse";
    ldir  = "info/unscoped/l/lcov-parse";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
