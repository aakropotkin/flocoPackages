{

  inputs.packument.url   = "https://registry.npmjs.org/minipass-json-stream?rev=2-f18f7ec4006e9919a01c0e0798bea222";
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
    ident = "minipass-json-stream";
    ldir  = "info/unscoped/m/minipass-json-stream";
    inherit packument fetchInfo;
  } // latest';

}
