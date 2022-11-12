{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.snakecase?_rev=19-02fb9f9acbbd04a478b9f6ca7833520c";
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
    ident = "lodash.snakecase";
    ldir  = "info/unscoped/l/lodash.snakecase";
    inherit packument fetchInfo;
  } // latest';

}
