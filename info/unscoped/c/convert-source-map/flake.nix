{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/convert-source-map?_rev=69-3e784a91a355b69a883ab9385c3257bb";
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
    ident = "convert-source-map";
    ldir  = "info/unscoped/c/convert-source-map";
    inherit packument fetchInfo;
  } // latest';

}
