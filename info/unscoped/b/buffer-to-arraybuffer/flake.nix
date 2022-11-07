{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-to-arraybuffer?rev=11-eb417e1eb921f8f45ca9b4607ec8533a";
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
    ident = "buffer-to-arraybuffer";
    ldir  = "info/unscoped/b/buffer-to-arraybuffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
