{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/istanbul?_rev=460-b629929ac7fb8d22e73c575ddeead76e";
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
    ident = "istanbul";
    ldir  = "info/unscoped/i/istanbul";
    inherit packument fetchInfo;
  } // latest';

}
