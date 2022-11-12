{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/seq-queue?_rev=15-c077212bfc497f2d9d7f1fcaa5f81ad2";
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
    ident = "seq-queue";
    ldir  = "info/unscoped/s/seq-queue";
    inherit packument fetchInfo;
  } // latest';

}
