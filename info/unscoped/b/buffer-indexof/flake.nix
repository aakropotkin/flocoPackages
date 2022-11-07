{

  inputs.packument.url   = "https://registry.npmjs.org/buffer-indexof?rev=16-b490c898c3b337dec807527ae3bc1f44";
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
    ident = "buffer-indexof";
    ldir  = "info/unscoped/b/buffer-indexof";
    inherit packument fetchInfo;
  } // latest';

}
