{

  inputs.packument.url   = "https://registry.npmjs.org/good-listener?rev=24-c27fdf7977950612a3c92d0731745f91";
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
    ident = "good-listener";
    ldir  = "info/unscoped/g/good-listener";
    inherit packument fetchInfo;
  } // latest';

}
