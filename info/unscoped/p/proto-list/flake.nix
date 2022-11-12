{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/proto-list?_rev=20-fc767b82e5bd90b4ca385f305fa2f06d";
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
    ident = "proto-list";
    ldir  = "info/unscoped/p/proto-list";
    inherit packument fetchInfo;
  } // latest';

}
