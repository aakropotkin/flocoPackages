{

  inputs.packument.url   = "https://registry.npmjs.org/y-leveldb?rev=9-68d4f446b7390c010d91acca05261fc1";
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
    ident = "y-leveldb";
    ldir  = "info/unscoped/y/y-leveldb";
    inherit packument fetchInfo;
  } // latest';

}
