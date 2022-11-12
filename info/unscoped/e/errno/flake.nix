{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/errno?_rev=46-84a2b5266ea4452ac004791ba5416c74";
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
    ident = "errno";
    ldir  = "info/unscoped/e/errno";
    inherit packument fetchInfo;
  } // latest';

}
