{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fast-xml-parser?_rev=121-20b4105a63c4042228d633a0f3a8365f";
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
    ident = "fast-xml-parser";
    ldir  = "info/unscoped/f/fast-xml-parser";
    inherit packument fetchInfo;
  } // latest';

}
