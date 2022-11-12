{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/find-versions?_rev=30-7d67e2ae0c89e05b200e34660371c845";
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
    ident = "find-versions";
    ldir  = "info/unscoped/f/find-versions";
    inherit packument fetchInfo;
  } // latest';

}
