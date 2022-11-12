{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-shift?_rev=5-31bb42c71069dd0eb1175d87b40f3922";
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
    ident = "stream-shift";
    ldir  = "info/unscoped/s/stream-shift";
    inherit packument fetchInfo;
  } // latest';

}
