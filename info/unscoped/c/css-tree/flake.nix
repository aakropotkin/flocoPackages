{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css-tree?_rev=62-03ef2d21564b44d123b2be960ba197e1";
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
    ident = "css-tree";
    ldir  = "info/unscoped/c/css-tree";
    inherit packument fetchInfo;
  } // latest';

}
