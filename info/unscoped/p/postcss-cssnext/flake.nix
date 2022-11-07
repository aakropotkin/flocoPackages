{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-cssnext?rev=69-442eb0cfb4b806a2a4897f1c4bc0aea6";
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
    ident = "postcss-cssnext";
    ldir  = "info/unscoped/p/postcss-cssnext";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
