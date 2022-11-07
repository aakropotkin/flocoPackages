{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-attribute-case-insensitive?rev=16-b4f049b04d9be0e3fcf00bb0cd3690fa";
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
    ident = "postcss-attribute-case-insensitive";
    ldir  = "info/unscoped/p/postcss-attribute-case-insensitive";
    inherit packument fetchInfo;
  } // latest';

}
