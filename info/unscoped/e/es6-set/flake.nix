{

  inputs.packument.url   = "https://registry.npmjs.org/es6-set?rev=18-b765c4d71f55eaa1b8a5901bef461ec1";
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
    ident = "es6-set";
    ldir  = "info/unscoped/e/es6-set";
    inherit packument fetchInfo;
  } // latest';

}
