{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv/component?_rev=222-309297405202c3833ae11ae151454fcd";
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
    ident = "@antv/component";
    ldir  = "info/antv/component";
    inherit packument fetchInfo;
  } // latest';

}
