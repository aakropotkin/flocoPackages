{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/analytics-types?_rev=1739-643c7a4e6b2f776026c09dcd0ec2ffdd";
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
    scope = "@firebase";
    ident = "@firebase/analytics-types";
    ldir  = "info/firebase/analytics-types";
    inherit packument fetchInfo;
  } // latest';

}
