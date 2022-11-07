{

  inputs.packument.url   = "https://registry.npmjs.org/run-parallel-limit?rev=13-2934a89e42b8878fca15d994d1bbeee7";
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
    ident = "run-parallel-limit";
    ldir  = "info/unscoped/r/run-parallel-limit";
    inherit packument fetchInfo;
  } // latest';

}
