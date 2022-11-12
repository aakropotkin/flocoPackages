{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/connect-history-api-fallback?_rev=541-2913e8b995ebbe8c3561d15e36f54d10";
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
    scope = "@types";
    ident = "@types/connect-history-api-fallback";
    ldir  = "info/types/connect-history-api-fallback";
    inherit packument fetchInfo;
  } // latest';

}
