{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-custom-media?rev=45-04396ef424b1baea4e15b05f44968813";
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
    ident = "postcss-custom-media";
    ldir  = "info/unscoped/p/postcss-custom-media";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
