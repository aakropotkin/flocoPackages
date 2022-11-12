{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-nesting?_rev=49-efd23a3eb61a62a1c323696047b90491";
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
    ident = "postcss-nesting";
    ldir  = "info/unscoped/p/postcss-nesting";
    inherit packument fetchInfo;
  } // latest';

}
