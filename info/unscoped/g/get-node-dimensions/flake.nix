{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/get-node-dimensions?_rev=12-a533b4e9cc889a1ca086090d7fa01092";
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
    ident = "get-node-dimensions";
    ldir  = "info/unscoped/g/get-node-dimensions";
    inherit packument fetchInfo;
  } // latest';

}
