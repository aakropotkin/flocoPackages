{

  inputs.packument.url   = "https://registry.npmjs.org/stealthy-require?rev=8-f310afb5356e9e82fe825349430ecd7c";
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
    ident = "stealthy-require";
    ldir  = "info/unscoped/s/stealthy-require";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
