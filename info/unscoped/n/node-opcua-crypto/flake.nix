{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-crypto?rev=65-bd84e23203b6d21d1b47adacf49f4e65";
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
    ident = "node-opcua-crypto";
    ldir  = "info/unscoped/n/node-opcua-crypto";
    inherit packument fetchInfo;
  } // latest';

}
