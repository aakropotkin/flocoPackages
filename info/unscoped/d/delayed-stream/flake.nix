{

  inputs.packument.url   = "https://registry.npmjs.org/delayed-stream?rev=23-fbb445ffaf4b8fd4d11e28793929c6e1";
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
    ident = "delayed-stream";
    ldir  = "info/unscoped/d/delayed-stream";
    inherit packument fetchInfo;
  } // latest';

}
