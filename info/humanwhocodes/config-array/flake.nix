{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@humanwhocodes/config-array?_rev=34-fc3f80cbb76a80655a5bf9c6e64023b1";
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
    scope = "@humanwhocodes";
    ident = "@humanwhocodes/config-array";
    ldir  = "info/humanwhocodes/config-array";
    inherit packument fetchInfo;
  } // latest';

}
