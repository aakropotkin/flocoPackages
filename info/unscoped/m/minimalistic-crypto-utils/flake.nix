{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/minimalistic-crypto-utils?_rev=4-b946fb83e7e0387acead97e063919da7";
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
    ident = "minimalistic-crypto-utils";
    ldir  = "info/unscoped/m/minimalistic-crypto-utils";
    inherit packument fetchInfo;
  } // latest';

}
