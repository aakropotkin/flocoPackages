{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mock-fs?_rev=150-575fef8a31ef6e977cb6d994f7ae9ad9";
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
    ident = "mock-fs";
    ldir  = "info/unscoped/m/mock-fs";
    inherit packument fetchInfo;
  } // latest';

}
