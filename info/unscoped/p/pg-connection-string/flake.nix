{

  inputs.packument.url   = "https://registry.npmjs.org/pg-connection-string?rev=27-a648c619bb005f32599ca02c20bca11b";
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
    ident = "pg-connection-string";
    ldir  = "info/unscoped/p/pg-connection-string";
    inherit packument fetchInfo;
  } // latest';

}
