{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-preset-env?rev=74-b769916511d2a2a0e3127485f63bf31f";
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
    ident = "postcss-preset-env";
    ldir  = "info/unscoped/p/postcss-preset-env";
    inherit packument fetchInfo;
  } // latest';

}
