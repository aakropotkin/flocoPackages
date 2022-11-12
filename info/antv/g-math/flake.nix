{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv/g-math?_rev=168-47933d46d5443717f395707670d8c9e0";
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
    ident = "@antv/g-math";
    ldir  = "info/antv/g-math";
    inherit packument fetchInfo;
  } // latest';

}
