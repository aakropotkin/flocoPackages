{

  inputs.packument.url   = "https://registry.npmjs.org/append-transform?rev=16-3c8c5858a909e28d7e522491b0bdcdb9";
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
    ident = "append-transform";
    ldir  = "info/unscoped/a/append-transform";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
