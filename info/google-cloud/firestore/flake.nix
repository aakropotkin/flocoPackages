{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@google-cloud%2ffirestore?_rev=148-94f7aa08a16e9bc9f9a59a101b70ff0e";
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
    scope = "@google-cloud";
    ident = "@google-cloud/firestore";
    ldir  = "info/google-cloud/firestore";
    inherit packument fetchInfo;
  } // latest';

}
