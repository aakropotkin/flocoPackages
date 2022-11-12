{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-discard-overridden?_rev=42-59875e469b98e3200a44538aaa01cbff";
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
    ident = "postcss-discard-overridden";
    ldir  = "info/unscoped/p/postcss-discard-overridden";
    inherit packument fetchInfo;
  } // latest';

}
