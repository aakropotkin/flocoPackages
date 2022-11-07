{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-image-set-polyfill?rev=18-46d9079d198861686325110f3e34e4fe";
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
    ident = "postcss-image-set-polyfill";
    ldir  = "info/unscoped/p/postcss-image-set-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
