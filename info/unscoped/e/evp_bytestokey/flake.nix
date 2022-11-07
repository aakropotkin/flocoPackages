{

  inputs.packument.url   = "https://registry.npmjs.org/evp_bytestokey?rev=10-3fa2f8385d99824e8f4093c182122c85";
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
    ident = "evp_bytestokey";
    ldir  = "info/unscoped/e/evp_bytestokey";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
