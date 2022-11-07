{

  inputs.packument.url   = "https://registry.npmjs.org/topo?rev=95-c4fdbc69829442797bcb0e6c7abd838c";
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
    ident = "topo";
    ldir  = "info/unscoped/t/topo";
    inherit packument fetchInfo;
  } // latest';

}
