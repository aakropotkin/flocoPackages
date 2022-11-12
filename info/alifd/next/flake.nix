{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@alifd%2fnext?_rev=579-36ed39bd2c89c4efa167fa6001b0b72e";
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
    scope = "@alifd";
    ident = "@alifd/next";
    ldir  = "info/alifd/next";
    inherit packument fetchInfo;
  } // latest';

}
