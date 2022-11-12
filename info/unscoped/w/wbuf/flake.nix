{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/wbuf?_rev=20-148979eae2d911ee940d036bde7c3c2e";
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
    ident = "wbuf";
    ldir  = "info/unscoped/w/wbuf";
    inherit packument fetchInfo;
  } // latest';

}
