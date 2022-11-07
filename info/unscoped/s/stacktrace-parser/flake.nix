{

  inputs.packument.url   = "https://registry.npmjs.org/stacktrace-parser?rev=15-916c928f3d77d77cfc3a8e0037d4d7db";
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
    ident = "stacktrace-parser";
    ldir  = "info/unscoped/s/stacktrace-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
