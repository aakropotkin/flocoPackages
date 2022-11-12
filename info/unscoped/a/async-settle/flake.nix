{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/async-settle?_rev=16-a7a08be85313d8ebeeca131349f74735";
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
    ident = "async-settle";
    ldir  = "info/unscoped/a/async-settle";
    inherit packument fetchInfo;
  } // latest';

}
