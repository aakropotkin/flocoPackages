{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/plur?_rev=22-382127cff348c3d16f0ab8b5d2d1260a";
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
    ident = "plur";
    ldir  = "info/unscoped/p/plur";
    inherit packument fetchInfo;
  } // latest';

}
