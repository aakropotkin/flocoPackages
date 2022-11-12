{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@polymer/polymer?_rev=79-03202cbf3c6c945469460e90d3a7fe28";
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
    scope = "@polymer";
    ident = "@polymer/polymer";
    ldir  = "info/polymer/polymer";
    inherit packument fetchInfo;
  } // latest';

}
