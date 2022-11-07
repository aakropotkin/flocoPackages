{

  inputs.packument.url   = "https://registry.npmjs.org/color-support?rev=9-082b2884f79cc8e08190181cd04d124e";
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
    ident = "color-support";
    ldir  = "info/unscoped/c/color-support";
    inherit packument fetchInfo;
  } // latest';

}
