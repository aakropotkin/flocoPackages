{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/multibase?_rev=36-0fe3362902a5126cefe037316cbeb8c7";
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
    ident = "multibase";
    ldir  = "info/unscoped/m/multibase";
    inherit packument fetchInfo;
  } // latest';

}
