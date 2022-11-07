{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-xor?rev=10-f348b6e9e89d38357c58f849e6cadf32";
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
    ident = "buffer-xor";
    ldir  = "info/unscoped/b/buffer-xor";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
