{

  inputs.packument.url   = "https://registry.npmjs.org/stdout-stream?rev=26-17cc462a7d6e24d99be7d3be5d1c16e6";
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
    ident = "stdout-stream";
    ldir  = "info/unscoped/s/stdout-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
