{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/detect-indent?_rev=52-f0e2baf591abbf65e6721b48fda5fa6e";
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
    ident = "detect-indent";
    ldir  = "info/unscoped/d/detect-indent";
    inherit packument fetchInfo;
  } // latest';

}
