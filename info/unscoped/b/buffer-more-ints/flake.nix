{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-more-ints?rev=9-cf8512745984fed7e1948ce680f73739";
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
    ident = "buffer-more-ints";
    ldir  = "info/unscoped/b/buffer-more-ints";
    inherit packument fetchInfo;
  } // latest';

}
