{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/xlsx?_rev=511-af39b073e6b3220ee6d5cdaf53a8553e";
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
    ident = "xlsx";
    ldir  = "info/unscoped/x/xlsx";
    inherit packument fetchInfo;
  } // latest';

}
