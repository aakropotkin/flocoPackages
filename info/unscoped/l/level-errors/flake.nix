{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/level-errors?_rev=24-fefc1151cc01fa1def6bd57afef179ec";
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
    ident = "level-errors";
    ldir  = "info/unscoped/l/level-errors";
    inherit packument fetchInfo;
  } // latest';

}
