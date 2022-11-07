{

  inputs.packument.url   = "https://registry.npmjs.org/sync-rpc?rev=17-f8609618a250e291c16e607840c28438";
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
    ident = "sync-rpc";
    ldir  = "info/unscoped/s/sync-rpc";
    inherit packument fetchInfo;
  } // latest';

}
