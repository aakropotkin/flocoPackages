{

  inputs.packument.url   = "https://registry.npmjs.org/simple-concat?rev=6-f47c83b63d9557a7075a787a7b0059be";
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
    ident = "simple-concat";
    ldir  = "info/unscoped/s/simple-concat";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
