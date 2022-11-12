{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/logform?_rev=35-70a6f779007ecd36d2ba8151084bf8e0";
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
    ident = "logform";
    ldir  = "info/unscoped/l/logform";
    inherit packument fetchInfo;
  } // latest';

}
