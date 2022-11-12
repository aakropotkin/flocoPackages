{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css?_rev=103-0d7aec86a6f955cc14e0b9c69914dfdd";
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
    ident = "css";
    ldir  = "info/unscoped/c/css";
    inherit packument fetchInfo;
  } // latest';

}
