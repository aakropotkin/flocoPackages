{

  inputs.packument.url   = "https://registry.npmjs.org/karma-mocha?rev=77-89c13ed382a2ace5f6b93a7da86ce371";
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
    ident = "karma-mocha";
    ldir  = "info/unscoped/k/karma-mocha";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
