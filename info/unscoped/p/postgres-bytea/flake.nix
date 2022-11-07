{

  inputs.packument.url   = "https://registry.npmjs.org/postgres-bytea?rev=6-e23b4f382f1deab67f1f8575918b53fb";
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
    ident = "postgres-bytea";
    ldir  = "info/unscoped/p/postgres-bytea";
    inherit packument fetchInfo;
  } // latest';

}
