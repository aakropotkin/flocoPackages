{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-truncate?_rev=14-1b0003ecca5b8250da0042e17adf047e";
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
    ident = "cli-truncate";
    ldir  = "info/unscoped/c/cli-truncate";
    inherit packument fetchInfo;
  } // latest';

}
