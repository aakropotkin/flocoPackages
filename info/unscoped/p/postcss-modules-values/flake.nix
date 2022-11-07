{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-modules-values?rev=29-24413d949f57431656faae3dc9c59ea1";
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
    ident = "postcss-modules-values";
    ldir  = "info/unscoped/p/postcss-modules-values";
    inherit packument fetchInfo;
  } // latest';

}
