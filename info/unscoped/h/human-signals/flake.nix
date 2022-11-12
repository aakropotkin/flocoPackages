{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/human-signals?_rev=9-f6eeefd8169cff0464a4962b2654a55f";
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
    ident = "human-signals";
    ldir  = "info/unscoped/h/human-signals";
    inherit packument fetchInfo;
  } // latest';

}
