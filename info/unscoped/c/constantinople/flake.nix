{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/constantinople?_rev=29-096e52333c307b17424f307ddb6841fd";
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
    ident = "constantinople";
    ldir  = "info/unscoped/c/constantinople";
    inherit packument fetchInfo;
  } // latest';

}
