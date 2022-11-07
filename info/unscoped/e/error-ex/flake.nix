{

  inputs.packument.url   = "https://registry.npmjs.org/error-ex?rev=25-1feec68ceabe2ae40290e7e696475476";
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
    ident = "error-ex";
    ldir  = "info/unscoped/e/error-ex";
    inherit packument fetchInfo;
  } // latest';

}
