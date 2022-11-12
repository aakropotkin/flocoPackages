{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/lodash?_rev=1705-d2bd1a32f7eb5b2e6ba36ce145fb9911";
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
    ident = "@types/lodash";
    ldir  = "info/types/lodash";
    inherit packument fetchInfo;
  } // latest';

}
