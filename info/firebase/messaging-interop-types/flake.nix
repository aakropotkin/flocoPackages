{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fmessaging-interop-types?_rev=435-9bb86a8ca2e7c4ac7fba01f9a80366ec";
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
    ident = "@firebase/messaging-interop-types";
    ldir  = "info/firebase/messaging-interop-types";
    inherit packument fetchInfo;
  } // latest';

}
