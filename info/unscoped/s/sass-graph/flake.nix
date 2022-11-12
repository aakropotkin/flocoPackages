{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sass-graph?_rev=46-bf1752c095a86716f1923bdcd413b384";
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
    ident = "sass-graph";
    ldir  = "info/unscoped/s/sass-graph";
    inherit packument fetchInfo;
  } // latest';

}
