{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-utils?rev=15-3c5c11104864f489520c4dd1d539b812";
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
    ident = "eslint-utils";
    ldir  = "info/unscoped/e/eslint-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
