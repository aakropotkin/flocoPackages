{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-xml2json?_rev=133-162ef12d0e4c098ef3d09c11045d4623";
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
