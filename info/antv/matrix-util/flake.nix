{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@antv%2fmatrix-util?_rev=89-b58e447f18586b934b9a5ec99b93ba06";
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
    ident = "@antv/matrix-util";
    ldir  = "info/antv/matrix-util";
    inherit packument fetchInfo;
  } // latest';

}
