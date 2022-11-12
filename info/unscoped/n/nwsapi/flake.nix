{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nwsapi?_rev=24-0a1b54ebef779e8a21dc84be361a9536";
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
    ident = "nwsapi";
    ldir  = "info/unscoped/n/nwsapi";
    inherit packument fetchInfo;
  } // latest';

}
