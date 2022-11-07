{

  inputs.packument.url   = "https://registry.npmjs.org/run-series?rev=42-e8750320fa4612d2f00d1e60f7fae5aa";
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
    ident = "run-series";
    ldir  = "info/unscoped/r/run-series";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
