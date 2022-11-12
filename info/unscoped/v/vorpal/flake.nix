{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vorpal?_rev=177-c1cac8a7f6fa39451b58479457e725bc";
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
    ident = "vorpal";
    ldir  = "info/unscoped/v/vorpal";
    inherit packument fetchInfo;
  } // latest';

}
