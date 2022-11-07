{

  inputs.packument.url   = "https://registry.npmjs.org/minimatch?rev=229-964f498568e02bb1e11d3f7b5cd330ca";
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
    ident = "minimatch";
    ldir  = "info/unscoped/m/minimatch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
