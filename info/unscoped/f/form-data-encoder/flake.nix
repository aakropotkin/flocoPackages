{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/form-data-encoder?_rev=31-a2a6ab2c5349e53ab16bba45df514a75";
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
    ident = "form-data-encoder";
    ldir  = "info/unscoped/f/form-data-encoder";
    inherit packument fetchInfo;
  } // latest';

}
