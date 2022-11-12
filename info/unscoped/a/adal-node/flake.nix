{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/adal-node?_rev=53-d6d2f2be3364946855338173e5bd19bb";
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
    ident = "adal-node";
    ldir  = "info/unscoped/a/adal-node";
    inherit packument fetchInfo;
  } // latest';

}
