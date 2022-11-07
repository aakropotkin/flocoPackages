{

  inputs.packument.url   = "https://registry.npmjs.org/mathml-tag-names?rev=14-d1afd483ae74fd7d91ca4b40832d75b6";
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
    ident = "mathml-tag-names";
    ldir  = "info/unscoped/m/mathml-tag-names";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
