{

  inputs.packument.url   = "https://registry.npmjs.org/yosay?rev=60-1305af240aafde3facc3b5bd082133e0";
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
    ident = "yosay";
    ldir  = "info/unscoped/y/yosay";
    inherit packument fetchInfo;
  } // latest';

}
