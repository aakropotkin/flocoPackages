{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mimic-fn?_rev=13-56ee110ca0c0e8d6981228404739c688";
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
    ident = "mimic-fn";
    ldir  = "info/unscoped/m/mimic-fn";
    inherit packument fetchInfo;
  } // latest';

}
