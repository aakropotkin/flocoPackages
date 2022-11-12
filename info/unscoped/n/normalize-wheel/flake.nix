{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/normalize-wheel?_rev=5-e1a8e11ef131beeee962d4afd78120b0";
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
    ident = "normalize-wheel";
    ldir  = "info/unscoped/n/normalize-wheel";
    inherit packument fetchInfo;
  } // latest';

}
