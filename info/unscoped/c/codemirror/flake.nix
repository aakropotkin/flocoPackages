{

  inputs.packument.url   = "https://registry.npmjs.org/codemirror?rev=257-55b257ada68cefcdf11ff8cac846285e";
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
    ident = "codemirror";
    ldir  = "info/unscoped/c/codemirror";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
