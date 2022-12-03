{

  inputs.packument.url   = "https://registry.npmjs.org/jest-websocket-mock";
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
    ident = "jest-websocket-mock";
    ldir  = "info/unscoped/j/jest-websocket-mock";
    inherit packument fetchInfo;
  } // latest';

}
