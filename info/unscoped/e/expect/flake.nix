{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/expect?_rev=340-8cdf739eb24dce382ab7114e3d253a1c";
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
    ident = "expect";
    ldir  = "info/unscoped/e/expect";
    inherit packument fetchInfo;
  } // latest';

}
