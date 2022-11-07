{

  inputs.packument.url   = "https://registry.npmjs.org/worker-farm?rev=83-55cbeca6aae1968acea24ca8c5c301dc";
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
    ident = "worker-farm";
    ldir  = "info/unscoped/w/worker-farm";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
