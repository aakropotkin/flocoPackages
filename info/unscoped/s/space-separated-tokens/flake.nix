{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/space-separated-tokens?_rev=12-b8d6be6279fe849d5e4e3c278113662f";
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
    ident = "space-separated-tokens";
    ldir  = "info/unscoped/s/space-separated-tokens";
    inherit packument fetchInfo;
  } // latest';

}
