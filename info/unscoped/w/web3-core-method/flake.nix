{

  inputs.packument.url   = "https://registry.npmjs.org/web3-core-method?rev=141-da069fd86b6575d38eda18d66a06cc15";
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
    ident = "web3-core-method";
    ldir  = "info/unscoped/w/web3-core-method";
    inherit packument fetchInfo;
  } // latest';

}
