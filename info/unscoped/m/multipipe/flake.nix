{

  inputs.packument.url   = "https://registry.npmjs.org/multipipe?rev=39-a7352eab25f1b9e54fed0a57db6d8266";
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
    ident = "multipipe";
    ldir  = "info/unscoped/m/multipipe";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
