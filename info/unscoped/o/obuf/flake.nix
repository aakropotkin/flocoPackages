{

  inputs.packument.url   = "https://registry.npmjs.org/obuf?rev=15-4603d502e214fce0d65af82815033aae";
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
    ident = "obuf";
    ldir  = "info/unscoped/o/obuf";
    inherit packument fetchInfo;
  } // latest';

}
