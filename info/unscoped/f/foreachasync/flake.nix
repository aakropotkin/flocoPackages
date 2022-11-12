{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/foreachasync?_rev=40-f60235be47fa16b49776bcbe563c2f72";
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
    ident = "foreachasync";
    ldir  = "info/unscoped/f/foreachasync";
    inherit packument fetchInfo;
  } // latest';

}
