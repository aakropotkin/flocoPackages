{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/readable-stream?_rev=214-a205553a502f0809685c6fcb66980346";
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
    ident = "readable-stream";
    ldir  = "info/unscoped/r/readable-stream";
    inherit packument fetchInfo;
  } // latest';

}
