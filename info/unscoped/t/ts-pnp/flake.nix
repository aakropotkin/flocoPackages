{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ts-pnp?_rev=10-2b66e5014252dd18173f096614e6682b";
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
    ident = "ts-pnp";
    ldir  = "info/unscoped/t/ts-pnp";
    inherit packument fetchInfo;
  } // latest';

}
