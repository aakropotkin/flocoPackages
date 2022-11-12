{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/read-pkg?_rev=24-f3e287507f9b6d98162d8d7c9c459017";
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
    ident = "read-pkg";
    ldir  = "info/unscoped/r/read-pkg";
    inherit packument fetchInfo;
  } // latest';

}
