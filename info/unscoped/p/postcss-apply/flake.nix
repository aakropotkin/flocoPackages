{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-apply?rev=18-3b4c64c457a68bbe45703414611ffbcd";
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
    ident = "postcss-apply";
    ldir  = "info/unscoped/p/postcss-apply";
    inherit packument fetchInfo;
  } // latest';

}
