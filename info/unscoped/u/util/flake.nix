{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/util?_rev=78-734062c31e91a3470cc1d26eea3db482";
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
    ident = "util";
    ldir  = "info/unscoped/u/util";
    inherit packument fetchInfo;
  } // latest';

}
