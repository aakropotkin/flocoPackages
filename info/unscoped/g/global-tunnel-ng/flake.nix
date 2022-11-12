{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/global-tunnel-ng?_rev=20-82a102899f38b60f94200253d2e88b6e";
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
    ident = "global-tunnel-ng";
    ldir  = "info/unscoped/g/global-tunnel-ng";
    inherit packument fetchInfo;
  } // latest';

}
