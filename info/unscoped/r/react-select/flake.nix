{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-select?_rev=260-077b94acfc431acafc51f451873699f4";
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
    ident = "react-select";
    ldir  = "info/unscoped/r/react-select";
    inherit packument fetchInfo;
  } // latest';

}
