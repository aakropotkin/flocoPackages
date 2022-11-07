{

  inputs.packument.url   = "https://registry.npmjs.org/schema-utils?rev=45-e79ce46f3ada82e18785cdc23d2b4aa5";
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
    ident = "schema-utils";
    ldir  = "info/unscoped/s/schema-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
