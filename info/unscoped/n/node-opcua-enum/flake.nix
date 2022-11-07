{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-enum?rev=91-516c785af56a5c44a7b881862cbf7f8a";
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
    ident = "node-opcua-enum";
    ldir  = "info/unscoped/n/node-opcua-enum";
    inherit packument fetchInfo;
  } // latest';

}
