{

  inputs.packument.url   = "https://registry.npmjs.org/@socket.io/component-emitter?rev=5-6f1e4f3775ee7746ac2d802aae7a8f09";
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
    scope = "@socket.io";
    ident = "@socket.io/component-emitter";
    ldir  = "info/socket.io/component-emitter";
    inherit packument fetchInfo;
  } // latest';

}
