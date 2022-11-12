{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-leak-detector?_rev=170-ec9c9e7070785f8670a96f420736957d";
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
    ident = "jest-leak-detector";
    ldir  = "info/unscoped/j/jest-leak-detector";
    inherit packument fetchInfo;
  } // latest';

}
