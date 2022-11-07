{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-font-variant?rev=21-76d4e84a6e6f17c24c6e0a6c4c42b6e7";
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
    ident = "postcss-font-variant";
    ldir  = "info/unscoped/p/postcss-font-variant";
    inherit packument fetchInfo;
  } // latest';

}
