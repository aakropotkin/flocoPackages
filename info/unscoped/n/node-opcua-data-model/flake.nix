{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-data-model?rev=161-ded44f760f99ac7622b03ed8ffbaa94b";
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
    ident = "node-opcua-data-model";
    ldir  = "info/unscoped/n/node-opcua-data-model";
    inherit packument fetchInfo;
  } // latest';

}
