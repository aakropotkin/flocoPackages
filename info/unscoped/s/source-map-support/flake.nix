{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/source-map-support?_rev=169-372c0a1ce9fd21eedbc2839defa934a9";
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
    ident = "source-map-support";
    ldir  = "info/unscoped/s/source-map-support";
    inherit packument fetchInfo;
  } // latest';

}
