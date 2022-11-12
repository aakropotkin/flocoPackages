{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/widest-line?_rev=12-773c391f5ff51384087a7784d43db2b0";
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
    ident = "widest-line";
    ldir  = "info/unscoped/w/widest-line";
    inherit packument fetchInfo;
  } // latest';

}
