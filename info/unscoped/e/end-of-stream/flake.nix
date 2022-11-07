{

  inputs.packument.url   = "https://registry.npmjs.org/end-of-stream?rev=48-50ebddcac79dd986ad6d57c35556bbad";
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
    ident = "end-of-stream";
    ldir  = "info/unscoped/e/end-of-stream";
    inherit packument fetchInfo;
  } // latest';

}
