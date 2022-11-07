{

  inputs.packument.url   = "https://registry.npmjs.org/crc32-stream?rev=32-4b1f9497e5fe5a90d94ee6b907e654d4";
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
    ident = "crc32-stream";
    ldir  = "info/unscoped/c/crc32-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
