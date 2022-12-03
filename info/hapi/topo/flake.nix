{

  inputs.packument.url   = "https://registry.npmjs.org/@hapi/topo";
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
    scope = "@hapi";
    ident = "@hapi/topo";
    ldir  = "info/hapi/topo";
    inherit packument fetchInfo;
  } // latest';

}
