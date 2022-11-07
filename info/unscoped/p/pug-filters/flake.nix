{

  inputs.packument.url   = "https://registry.npmjs.org/pug-filters?rev=42-913d25dcbf92dac47107bd439d91ef7a";
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
    ident = "pug-filters";
    ldir  = "info/unscoped/p/pug-filters";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
