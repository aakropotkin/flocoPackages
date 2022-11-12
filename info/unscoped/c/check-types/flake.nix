{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/check-types?_rev=157-e9896235dcab50886f56132e77118352";
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
    ident = "check-types";
    ldir  = "info/unscoped/c/check-types";
    inherit packument fetchInfo;
  } // latest';

}
