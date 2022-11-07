{

  inputs.packument.url   = "https://registry.npmjs.org/node-int64?rev=29-6ac273456e7a214e35865a8964396c51";
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
    ident = "node-int64";
    ldir  = "info/unscoped/n/node-int64";
    inherit packument fetchInfo;
  } // latest';

}
