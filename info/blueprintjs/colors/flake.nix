{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@blueprintjs/colors?_rev=30-9b914751323fcec35b1a3d2532e48b32";
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
    scope = "@blueprintjs";
    ident = "@blueprintjs/colors";
    ldir  = "info/blueprintjs/colors";
    inherit packument fetchInfo;
  } // latest';

}
