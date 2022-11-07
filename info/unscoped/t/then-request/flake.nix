{

  inputs.packument.url   = "https://registry.npmjs.org/then-request?rev=54-4bd9d3384ed591ee6830179ef3023369";
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
    ident = "then-request";
    ldir  = "info/unscoped/t/then-request";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
