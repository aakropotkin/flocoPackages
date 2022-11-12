{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@npmcli%2fdisparity-colors?_rev=17-9185116de722c6e4af5f0255ed33c6a9";
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
    ident = "@npmcli/disparity-colors";
    ldir  = "info/npmcli/disparity-colors";
    inherit packument fetchInfo;
  } // latest';

}
