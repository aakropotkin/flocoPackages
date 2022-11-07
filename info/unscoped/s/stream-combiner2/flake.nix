{

  inputs.packument.url   = "https://registry.npmjs.org/stream-combiner2?rev=26-97d40ef60f1651d95636d072f6ddcb0a";
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
    ident = "stream-combiner2";
    ldir  = "info/unscoped/s/stream-combiner2";
    inherit packument fetchInfo;
  } // latest';

}
