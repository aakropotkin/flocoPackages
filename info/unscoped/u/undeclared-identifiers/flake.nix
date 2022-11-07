{

  inputs.packument.url   = "https://registry.npmjs.org/undeclared-identifiers?rev=6-e89be22cedfe889640866691d4d28b22";
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
    ident = "undeclared-identifiers";
    ldir  = "info/unscoped/u/undeclared-identifiers";
    inherit packument fetchInfo;
  } // latest';

}
