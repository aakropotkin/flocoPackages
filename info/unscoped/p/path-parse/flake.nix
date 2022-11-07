{

  inputs.packument.url   = "https://registry.npmjs.org/path-parse?rev=15-1728231e413573a33eb487fb6efa1a71";
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
    ident = "path-parse";
    ldir  = "info/unscoped/p/path-parse";
    inherit packument fetchInfo;
  } // latest';

}
