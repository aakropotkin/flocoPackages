{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/io-ts-types?_rev=57-b2483725ae6cab1562b01078468eb142";
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
    ident = "io-ts-types";
    ldir  = "info/unscoped/i/io-ts-types";
    inherit packument fetchInfo;
  } // latest';

}
