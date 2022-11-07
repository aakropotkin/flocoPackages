{

  inputs.packument.url   = "https://registry.npmjs.org/csv?rev=295-e8038a43731f45695822a3d08d4c1295";
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
    ident = "csv";
    ldir  = "info/unscoped/c/csv";
    inherit packument fetchInfo;
  } // latest';

}
