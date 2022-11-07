{

  inputs.packument.url   = "https://registry.npmjs.org/os-browserify?rev=15-534b4492dfaf2b9c5d1450bcda777679";
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
    ident = "os-browserify";
    ldir  = "info/unscoped/o/os-browserify";
    inherit packument fetchInfo;
  } // latest';

}
