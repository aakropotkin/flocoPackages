{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/micromark-util-normalize-identifier?_rev=5-24a99e0c0325bca9bb90fdcd4d71025a";
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
    ident = "micromark-util-normalize-identifier";
    ldir  = "info/unscoped/m/micromark-util-normalize-identifier";
    inherit packument fetchInfo;
  } // latest';

}
