{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-xml2json";
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
    ident = "node-opcua-xml2json";
    ldir  = "info/unscoped/n/node-opcua-xml2json";
    inherit packument fetchInfo;
  } // latest';

}
