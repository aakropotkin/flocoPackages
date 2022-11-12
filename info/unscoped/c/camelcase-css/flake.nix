{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/camelcase-css?_rev=7-1a9cab38eefdd52a3c11c2626d0ec101";
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
    ident = "camelcase-css";
    ldir  = "info/unscoped/c/camelcase-css";
    inherit packument fetchInfo;
  } // latest';

}
