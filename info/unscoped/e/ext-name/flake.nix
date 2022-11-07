{

  inputs.packument.url   = "https://registry.npmjs.org/ext-name?rev=23-61380dc5ffadae4e85c8bad13ed4fb9b";
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
    ident = "ext-name";
    ldir  = "info/unscoped/e/ext-name";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
