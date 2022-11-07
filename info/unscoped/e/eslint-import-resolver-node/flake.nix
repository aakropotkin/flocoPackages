{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-import-resolver-node?rev=26-be574388c2beb667716925fdc380f226";
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
    ident = "eslint-import-resolver-node";
    ldir  = "info/unscoped/e/eslint-import-resolver-node";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
