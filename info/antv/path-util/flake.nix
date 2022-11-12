{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv/path-util?_rev=79-e1bac02dcdab486533ee5c3e7a430765";
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
    ident = "@antv/path-util";
    ldir  = "info/antv/path-util";
    inherit packument fetchInfo;
  } // latest';

}
