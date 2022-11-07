{

  inputs.packument.url   = "https://registry.npmjs.org/metro-minify-terser?rev=59-a6753e0b8e5e268a3be5b9d8078fe4ba";
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
    ident = "metro-minify-terser";
    ldir  = "info/unscoped/m/metro-minify-terser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
