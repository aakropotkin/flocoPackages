{

  inputs.packument.url   = "https://registry.npmjs.org/bmp-js?rev=9-af07f6a7ff712204a552ee5e951886bf";
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
    ident = "bmp-js";
    ldir  = "info/unscoped/b/bmp-js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
