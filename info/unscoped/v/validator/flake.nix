{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/validator?_rev=888-6bf5e7b1dfcfeff2619f8fabc2293d12";
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
    ident = "validator";
    ldir  = "info/unscoped/v/validator";
    inherit packument fetchInfo;
  } // latest';

}
