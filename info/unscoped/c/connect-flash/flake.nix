{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/connect-flash?_rev=120-15c47d2da0e16bf3226512d241349aa6";
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
    ident = "connect-flash";
    ldir  = "info/unscoped/c/connect-flash";
    inherit packument fetchInfo;
  } // latest';

}
