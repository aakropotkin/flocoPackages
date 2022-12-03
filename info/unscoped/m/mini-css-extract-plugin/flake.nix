{

  inputs.packument.url   = "https://registry.npmjs.org/mini-css-extract-plugin";
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
    ident = "mini-css-extract-plugin";
    ldir  = "info/unscoped/m/mini-css-extract-plugin";
    inherit packument fetchInfo;
  } // latest';

}
