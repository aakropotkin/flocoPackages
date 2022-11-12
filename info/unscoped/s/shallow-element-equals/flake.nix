{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/shallow-element-equals?_rev=4-07c8e34a99fa90b858b3308e646eb853";
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
    ident = "shallow-element-equals";
    ldir  = "info/unscoped/s/shallow-element-equals";
    inherit packument fetchInfo;
  } // latest';

}
