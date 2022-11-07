{

  inputs.packument.url   = "https://registry.npmjs.org/doctrine?rev=91-e2c9dab190f184b59e06b691268ae011";
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
    ident = "doctrine";
    ldir  = "info/unscoped/d/doctrine";
    inherit packument fetchInfo;
  } // latest';

}
