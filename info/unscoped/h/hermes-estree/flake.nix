{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hermes-estree?_rev=7-39ca0e2eb864ac59868246fc2d27d9b5";
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
    ident = "hermes-estree";
    ldir  = "info/unscoped/h/hermes-estree";
    inherit packument fetchInfo;
  } // latest';

}
