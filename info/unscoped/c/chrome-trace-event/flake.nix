{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/chrome-trace-event?_rev=12-38cab4c21f5c2a695d56303f6555e1fc";
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
    ident = "chrome-trace-event";
    ldir  = "info/unscoped/c/chrome-trace-event";
    inherit packument fetchInfo;
  } // latest';

}
