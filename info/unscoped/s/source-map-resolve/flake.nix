{

  inputs.packument.url   = "https://registry.npmjs.org/source-map-resolve?rev=30-39281f0fbd4b46be37fc361cd55b99b8";
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
    ident = "source-map-resolve";
    ldir  = "info/unscoped/s/source-map-resolve";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
