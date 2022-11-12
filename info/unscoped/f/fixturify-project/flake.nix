{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fixturify-project?_rev=44-b8a0c1901069216d7ac6adf6aed7db80";
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
    ident = "fixturify-project";
    ldir  = "info/unscoped/f/fixturify-project";
    inherit packument fetchInfo;
  } // latest';

}
