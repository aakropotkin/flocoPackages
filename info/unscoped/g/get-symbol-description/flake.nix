{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/get-symbol-description?_rev=1-5acc86599a8996114927740aade58531";
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
    ident = "get-symbol-description";
    ldir  = "info/unscoped/g/get-symbol-description";
    inherit packument fetchInfo;
  } // latest';

}
