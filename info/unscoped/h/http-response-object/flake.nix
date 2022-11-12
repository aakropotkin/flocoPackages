{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/http-response-object?_rev=17-ec38cb7bf1088fb3fe51021876814a45";
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
    ident = "http-response-object";
    ldir  = "info/unscoped/h/http-response-object";
    inherit packument fetchInfo;
  } // latest';

}
