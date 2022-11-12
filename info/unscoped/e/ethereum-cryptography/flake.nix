{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ethereum-cryptography?_rev=28-7f54dd183fc920f03b6cbaf945221461";
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
    ident = "ethereum-cryptography";
    ldir  = "info/unscoped/e/ethereum-cryptography";
    inherit packument fetchInfo;
  } // latest';

}
