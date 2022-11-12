{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sentence-case?_rev=38-e3c809f5a618561c33b0f2581f452492";
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
    ident = "sentence-case";
    ldir  = "info/unscoped/s/sentence-case";
    inherit packument fetchInfo;
  } // latest';

}
