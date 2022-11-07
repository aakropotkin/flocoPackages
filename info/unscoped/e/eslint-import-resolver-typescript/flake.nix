{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-import-resolver-typescript?rev=43-0eb7d96821e4dd9892d6a970d1bdbd1f";
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
    ident = "eslint-import-resolver-typescript";
    ldir  = "info/unscoped/e/eslint-import-resolver-typescript";
    inherit packument fetchInfo;
  } // latest';

}
