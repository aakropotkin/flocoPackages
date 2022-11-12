{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-array?_rev=67-183e482e972368af61c43e746b0f211f";
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
    ident = "d3-array";
    ldir  = "info/unscoped/d/d3-array";
    inherit packument fetchInfo;
  } // latest';

}
