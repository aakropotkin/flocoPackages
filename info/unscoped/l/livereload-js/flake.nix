{

  inputs.packument.url   = "https://registry.npmjs.org/livereload-js?rev=42-3bc338b465ebc469837a45dbdbf9513e";
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
    ident = "livereload-js";
    ldir  = "info/unscoped/l/livereload-js";
    inherit packument fetchInfo;
  } // latest';

}
