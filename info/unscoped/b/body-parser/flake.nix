{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/body-parser?_rev=815-27d4f3a1808415a366df6cefc7118d6c";
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
    ident = "body-parser";
    ldir  = "info/unscoped/b/body-parser";
    inherit packument fetchInfo;
  } // latest';

}
