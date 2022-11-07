{

  inputs.packument.url   = "https://registry.npmjs.org/web3-core-requestmanager?rev=112-22f1519365714a2269772ee756ef89f4";
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
    ident = "web3-core-requestmanager";
    ldir  = "info/unscoped/w/web3-core-requestmanager";
    inherit packument fetchInfo;
  } // latest';

}
