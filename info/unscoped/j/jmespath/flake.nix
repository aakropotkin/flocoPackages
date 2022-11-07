{

  inputs.packument.url   = "https://registry.npmjs.org/jmespath?rev=25-2a43e0cd31adb00d47bd5929ee308e00";
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
    ident = "jmespath";
    ldir  = "info/unscoped/j/jmespath";
    inherit packument fetchInfo;
  } // latest';

}
