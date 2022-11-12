{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-preset-current-node-syntax?_rev=8-0ca2a32b4a8d123917f99197655fa12c";
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
    ident = "babel-preset-current-node-syntax";
    ldir  = "info/unscoped/b/babel-preset-current-node-syntax";
    inherit packument fetchInfo;
  } // latest';

}
