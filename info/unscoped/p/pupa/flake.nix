{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pupa?_rev=11-e844f3a93c315b9492f42d82dde3fcd3";
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
    ident = "pupa";
    ldir  = "info/unscoped/p/pupa";
    inherit packument fetchInfo;
  } // latest';

}
