{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-width?_rev=18-26a87d58f286b918bde5a7386fd3f0f8";
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
    ident = "cli-width";
    ldir  = "info/unscoped/c/cli-width";
    inherit packument fetchInfo;
  } // latest';

}
