{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bin-build?_rev=31-017b6a0de121bef214cc995d8e6f1917";
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
    ident = "bin-build";
    ldir  = "info/unscoped/b/bin-build";
    inherit packument fetchInfo;
  } // latest';

}
