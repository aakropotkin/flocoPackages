{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tslint?_rev=325-792570184f0182a7539255c7c1807fdc";
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
    ident = "tslint";
    ldir  = "info/unscoped/t/tslint";
    inherit packument fetchInfo;
  } // latest';

}
