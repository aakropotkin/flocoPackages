{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/faker?_rev=356-476e662ef9be82c00f77da645f4774df";
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
    ident = "faker";
    ldir  = "info/unscoped/f/faker";
    inherit packument fetchInfo;
  } // latest';

}
