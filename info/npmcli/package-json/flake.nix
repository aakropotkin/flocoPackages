{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@npmcli%2fpackage-json?_rev=8-a6ee9dcaaafa8696c83c80200d5f8462";
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
    scope = "@npmcli";
    ident = "@npmcli/package-json";
    ldir  = "info/npmcli/package-json";
    inherit packument fetchInfo;
  } // latest';

}
