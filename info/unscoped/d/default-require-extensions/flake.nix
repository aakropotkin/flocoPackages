{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/default-require-extensions?_rev=10-8ea08f6fd604567b1231e28880ae3526";
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
    ident = "default-require-extensions";
    ldir  = "info/unscoped/d/default-require-extensions";
    inherit packument fetchInfo;
  } // latest';

}
