{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-crc32?rev=27-c273578b3de4bd250995b2b0358a68ea";
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
    ident = "buffer-crc32";
    ldir  = "info/unscoped/b/buffer-crc32";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
