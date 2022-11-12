{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/peek-readable?_rev=19-e9579acff8acca7454ce76b07f89f530";
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
    ident = "peek-readable";
    ldir  = "info/unscoped/p/peek-readable";
    inherit packument fetchInfo;
  } // latest';

}
