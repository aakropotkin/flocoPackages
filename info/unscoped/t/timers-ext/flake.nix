{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/timers-ext?_rev=16-12d3ec71f82e68199034a58e6a7c8830";
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
    ident = "timers-ext";
    ldir  = "info/unscoped/t/timers-ext";
    inherit packument fetchInfo;
  } // latest';

}
