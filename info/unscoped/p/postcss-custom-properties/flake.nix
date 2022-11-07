{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-custom-properties?rev=88-91468979215c742d23d618356e3e0d45";
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
    ident = "postcss-custom-properties";
    ldir  = "info/unscoped/p/postcss-custom-properties";
    inherit packument fetchInfo;
  } // latest';

}
