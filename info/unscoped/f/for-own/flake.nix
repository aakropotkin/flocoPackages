{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/for-own?_rev=15-8e45e4003aa546cf3f92c365c2e93c41";
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
    ident = "for-own";
    ldir  = "info/unscoped/f/for-own";
    inherit packument fetchInfo;
  } // latest';

}
