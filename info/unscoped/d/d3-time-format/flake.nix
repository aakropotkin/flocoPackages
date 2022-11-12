{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-time-format?_rev=45-4f7e11bd1a4129133ec618f05e717009";
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
    ident = "d3-time-format";
    ldir  = "info/unscoped/d/d3-time-format";
    inherit packument fetchInfo;
  } // latest';

}
