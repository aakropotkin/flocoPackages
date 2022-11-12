{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv/scale?_rev=134-8d14c791420991060e97df27fa957070";
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
    ident = "@antv/scale";
    ldir  = "info/antv/scale";
    inherit packument fetchInfo;
  } // latest';

}
