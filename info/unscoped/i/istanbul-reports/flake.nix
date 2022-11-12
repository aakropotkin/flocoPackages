{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/istanbul-reports?_rev=82-316d14b6a32b05b0c71c2efcbd497b91";
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
    ident = "istanbul-reports";
    ldir  = "info/unscoped/i/istanbul-reports";
    inherit packument fetchInfo;
  } // latest';

}
