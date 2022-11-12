{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/wmf?_rev=22-c9f61b7d50fa8d2470324cead380ae7c";
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
    ident = "wmf";
    ldir  = "info/unscoped/w/wmf";
    inherit packument fetchInfo;
  } // latest';

}
