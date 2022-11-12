{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/unbzip2-stream?_rev=40-db9250c995c85074de4ebc91f5733b05";
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
    scope = null;
    ident = "unbzip2-stream";
    ldir  = "info/unscoped/u/unbzip2-stream";
    inherit packument fetchInfo;
  } // latest';

}
