{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browserify?_rev=2232-d46fda267d14febf57bc59520615172e";
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
    ident = "browserify";
    ldir  = "info/unscoped/b/browserify";
    inherit packument fetchInfo;
  } // latest';

}
