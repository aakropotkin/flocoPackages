{

  inputs.packument.url   = "https://registry.npmjs.org/decompress-response?rev=15-b4186daf90a0fcd2fca8a507fbd89840";
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
    ident = "decompress-response";
    ldir  = "info/unscoped/d/decompress-response";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
