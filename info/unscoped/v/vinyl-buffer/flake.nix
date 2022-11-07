{

  inputs.packument.url   = "https://registry.npmjs.org/vinyl-buffer?rev=46-0d8f0406c6c4dac357b92f4120488335";
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
    ident = "vinyl-buffer";
    ldir  = "info/unscoped/v/vinyl-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
