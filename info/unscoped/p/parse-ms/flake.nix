{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/parse-ms?_rev=19-244698b65f252564d2630e96ffdcbbe7";
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
    ident = "parse-ms";
    ldir  = "info/unscoped/p/parse-ms";
    inherit packument fetchInfo;
  } // latest';

}
