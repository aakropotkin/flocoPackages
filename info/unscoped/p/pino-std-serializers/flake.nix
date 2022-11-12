{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pino-std-serializers?_rev=31-80cb7c4eba386ef1013ed0269dcd20f8";
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
    ident = "pino-std-serializers";
    ldir  = "info/unscoped/p/pino-std-serializers";
    inherit packument fetchInfo;
  } // latest';

}
