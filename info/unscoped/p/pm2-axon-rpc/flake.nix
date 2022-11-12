{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pm2-axon-rpc?_rev=36-51a81bf20fb710969a08e7ab216d0fc3";
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
    ident = "pm2-axon-rpc";
    ldir  = "info/unscoped/p/pm2-axon-rpc";
    inherit packument fetchInfo;
  } // latest';

}
