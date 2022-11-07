{

  inputs.packument.url   = "https://registry.npmjs.org/jscodeshift?rev=83-9facafe4105eb324fb2f76e429504ad3";
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
    ident = "jscodeshift";
    ldir  = "info/unscoped/j/jscodeshift";
    inherit packument fetchInfo;
  } // latest';

}
