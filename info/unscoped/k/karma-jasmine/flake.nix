{

  inputs.packument.url   = "https://registry.npmjs.org/karma-jasmine?rev=137-3c68e4ed34cb50ce5f054d1e522788af";
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
    ident = "karma-jasmine";
    ldir  = "info/unscoped/k/karma-jasmine";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
