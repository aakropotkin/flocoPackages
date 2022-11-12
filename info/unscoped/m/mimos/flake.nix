{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mimos?_rev=50-e3d1dbcc46f8ec69c93307b910c05afe";
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
    ident = "mimos";
    ldir  = "info/unscoped/m/mimos";
    inherit packument fetchInfo;
  } // latest';

}
