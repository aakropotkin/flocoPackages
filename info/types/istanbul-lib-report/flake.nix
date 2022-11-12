{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/istanbul-lib-report?_rev=445-4e2256fcc7736515fe1b3824c22b1ab1";
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
    ident = "@types/istanbul-lib-report";
    ldir  = "info/types/istanbul-lib-report";
    inherit packument fetchInfo;
  } // latest';

}
