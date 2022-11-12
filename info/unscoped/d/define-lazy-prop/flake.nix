{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/define-lazy-prop?_rev=5-90de61f8e78910da87ff39f495005fda";
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
    ident = "define-lazy-prop";
    ldir  = "info/unscoped/d/define-lazy-prop";
    inherit packument fetchInfo;
  } // latest';

}
