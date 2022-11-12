{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/copy-concurrently?_rev=31-b0d6a33aeba7313817c7f9d5124caa6f";
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
    ident = "copy-concurrently";
    ldir  = "info/unscoped/c/copy-concurrently";
    inherit packument fetchInfo;
  } // latest';

}
