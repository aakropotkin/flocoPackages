{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/left-pad?_rev=46-bde335d73907b09f1294adab680fbe74";
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
    ident = "left-pad";
    ldir  = "info/unscoped/l/left-pad";
    inherit packument fetchInfo;
  } // latest';

}
