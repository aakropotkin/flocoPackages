{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/which-module?_rev=8-128a28296394d93051d2f3c692614914";
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
    ident = "which-module";
    ldir  = "info/unscoped/w/which-module";
    inherit packument fetchInfo;
  } // latest';

}
