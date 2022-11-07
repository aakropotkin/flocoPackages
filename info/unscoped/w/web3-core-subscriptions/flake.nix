{

  inputs.packument.url   = "https://registry.npmjs.org/web3-core-subscriptions?rev=141-016980cfc871d9aa2c1b329fb0afb0ab";
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
    ident = "web3-core-subscriptions";
    ldir  = "info/unscoped/w/web3-core-subscriptions";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
