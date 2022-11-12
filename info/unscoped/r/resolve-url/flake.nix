{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/resolve-url?_rev=10-c1281aab9ce4c124349d065cb66af0b0";
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
    ident = "resolve-url";
    ldir  = "info/unscoped/r/resolve-url";
    inherit packument fetchInfo;
  } // latest';

}
