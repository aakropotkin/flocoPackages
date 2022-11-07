{

  inputs.packument.url   = "https://registry.npmjs.org/bip39?rev=63-908b356f1814063f7b4cb822adc6319f";
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
    ident = "bip39";
    ldir  = "info/unscoped/b/bip39";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
