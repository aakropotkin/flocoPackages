{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/xmlchars?_rev=11-2da42b8fe5e0331cac8e7c0694b55c33";
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
    ident = "xmlchars";
    ldir  = "info/unscoped/x/xmlchars";
    inherit packument fetchInfo;
  } // latest';

}
