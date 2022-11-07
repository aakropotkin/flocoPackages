{

  inputs.packument.url   = "https://registry.npmjs.org/constant-case?rev=22-faea36c1265f5ace6ca0a9cc0078f105";
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
    ident = "constant-case";
    ldir  = "info/unscoped/c/constant-case";
    inherit packument fetchInfo;
  } // latest';

}
