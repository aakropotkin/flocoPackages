{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/findup-sync?_rev=46-3716da385efbce2e7211710e9460f8b4";
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
    ident = "findup-sync";
    ldir  = "info/unscoped/f/findup-sync";
    inherit packument fetchInfo;
  } // latest';

}
