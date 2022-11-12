{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv%2fg-base?_rev=118-38a845738b00e1430666575ba34fcde5";
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
    ident = "@antv/g-base";
    ldir  = "info/antv/g-base";
    inherit packument fetchInfo;
  } // latest';

}
