{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/istanbul-reports?_rev=468-c748a9e70a61d9938e0e4d441e441ef7";
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
    ident = "@types/istanbul-reports";
    ldir  = "info/types/istanbul-reports";
    inherit packument fetchInfo;
  } // latest';

}
