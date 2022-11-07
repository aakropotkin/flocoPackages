{

  inputs.packument.url   = "https://registry.npmjs.org/cssom?rev=52-2ab5d788b53685f3b2e13777fbbddfe9";
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
    ident = "cssom";
    ldir  = "info/unscoped/c/cssom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
