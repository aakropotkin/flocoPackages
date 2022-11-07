{

  inputs.packument.url   = "https://registry.npmjs.org/native-duplexpair?rev=2-4e50d679e64144a900ea3ee25653418f";
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
    ident = "native-duplexpair";
    ldir  = "info/unscoped/n/native-duplexpair";
    inherit packument fetchInfo;
  } // latest';

}
