{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/json2module?_rev=5-4bcfabf976e9355939d4d41a43806dc1";
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
    ident = "json2module";
    ldir  = "info/unscoped/j/json2module";
    inherit packument fetchInfo;
  } // latest';

}
