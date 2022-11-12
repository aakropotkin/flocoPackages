{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fd-slicer?_rev=43-b6b98b13b96e050c2c8388d802105452";
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
    ident = "fd-slicer";
    ldir  = "info/unscoped/f/fd-slicer";
    inherit packument fetchInfo;
  } // latest';

}
