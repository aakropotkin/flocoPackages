{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/run-async?_rev=14-6f5c30aec39e8b2be0e80c67f5b38ff3";
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
    ident = "run-async";
    ldir  = "info/unscoped/r/run-async";
    inherit packument fetchInfo;
  } // latest';

}
