{

  inputs.packument.url   = "https://registry.npmjs.org/nunjucks?rev=166-c2137009b230bfdac1a4617570241851";
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
    ident = "nunjucks";
    ldir  = "info/unscoped/n/nunjucks";
    inherit packument fetchInfo;
  } // latest';

}
