{

  inputs.packument.url   = "https://registry.npmjs.org/combine-source-map?rev=29-c198c85d9e3d5d5026f07278971fdcbe";
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
    ident = "combine-source-map";
    ldir  = "info/unscoped/c/combine-source-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
