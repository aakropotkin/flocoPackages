{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/collection-visit?_rev=11-c6b1096516de72c3b314f2a967de5917";
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
    ident = "collection-visit";
    ldir  = "info/unscoped/c/collection-visit";
    inherit packument fetchInfo;
  } // latest';

}
