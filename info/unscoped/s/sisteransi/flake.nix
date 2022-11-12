{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sisteransi?_rev=10-df24a12d72e7545f50b5c999f79634f1";
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
    ident = "sisteransi";
    ldir  = "info/unscoped/s/sisteransi";
    inherit packument fetchInfo;
  } // latest';

}
