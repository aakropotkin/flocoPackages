{

  inputs.packument.url   = "https://registry.npmjs.org/heimdalljs?rev=31-fcef9ee286751371d410c980bf495bc9";
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
    ident = "heimdalljs";
    ldir  = "info/unscoped/h/heimdalljs";
    inherit packument fetchInfo;
  } // latest';

}
