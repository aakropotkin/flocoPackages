{

  inputs.packument.url   = "https://registry.npmjs.org/pg-types?rev=34-81a859d171831fd549d78c72e65e1aac";
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
    ident = "pg-types";
    ldir  = "info/unscoped/p/pg-types";
    inherit packument fetchInfo;
  } // latest';

}
