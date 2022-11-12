{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv/color-util?_rev=65-ed4bfd4cd1198a014febf4637295e164";
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
    scope = "@antv";
    ident = "@antv/color-util";
    ldir  = "info/antv/color-util";
    inherit packument fetchInfo;
  } // latest';

}
