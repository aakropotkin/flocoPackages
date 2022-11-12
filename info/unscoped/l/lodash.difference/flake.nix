{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.difference?_rev=51-90184d78d337090adfc8f844e26f3d42";
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
    ident = "lodash.difference";
    ldir  = "info/unscoped/l/lodash.difference";
    inherit packument fetchInfo;
  } // latest';

}
