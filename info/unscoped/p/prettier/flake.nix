{

  inputs.packument.url   = "https://registry.npmjs.org/prettier?rev=211-a6b3e66e3532715afcf655a1606d2960";
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
    ident = "prettier";
    ldir  = "info/unscoped/p/prettier";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
