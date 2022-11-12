{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/timm?_rev=49-2f7ff1b72b17ab32b9da51ac47d1260d";
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
    ident = "timm";
    ldir  = "info/unscoped/t/timm";
    inherit packument fetchInfo;
  } // latest';

}
