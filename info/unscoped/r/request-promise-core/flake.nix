{

  inputs.packument.url   = "https://registry.npmjs.org/request-promise-core?rev=7-8f5629967c2c1d26a57b7b7e909237e3";
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
    ident = "request-promise-core";
    ldir  = "info/unscoped/r/request-promise-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
