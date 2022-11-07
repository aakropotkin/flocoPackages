{

  inputs.packument.url   = "https://registry.npmjs.org/buffer?rev=180-e396317df4e390346e69c4fd1fb92071";
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
    ident = "buffer";
    ldir  = "info/unscoped/b/buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
