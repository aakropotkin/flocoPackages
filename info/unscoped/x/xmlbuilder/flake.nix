{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/xmlbuilder?_rev=212-b9412d88a785b0de340f3d147a778ebb";
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
    ident = "xmlbuilder";
    ldir  = "info/unscoped/x/xmlbuilder";
    inherit packument fetchInfo;
  } // latest';

}
