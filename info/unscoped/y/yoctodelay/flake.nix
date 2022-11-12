{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/yoctodelay?_rev=5-b0c311f7affe975d90d7f2ff243aee2d";
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
    ident = "yoctodelay";
    ldir  = "info/unscoped/y/yoctodelay";
    inherit packument fetchInfo;
  } // latest';

}
