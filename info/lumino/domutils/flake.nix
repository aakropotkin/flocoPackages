{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@lumino%2fdomutils?_rev=37-730724baf312cd3d280f95680012681b";
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
    scope = "@lumino";
    ident = "@lumino/domutils";
    ldir  = "info/lumino/domutils";
    inherit packument fetchInfo;
  } // latest';

}
