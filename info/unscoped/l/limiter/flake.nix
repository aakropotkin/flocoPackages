{

  inputs.packument.url   = "https://registry.npmjs.org/limiter?rev=60-92ca9858cf06d8c0d0b0ce12744e2a0d";
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
    ident = "limiter";
    ldir  = "info/unscoped/l/limiter";
    inherit packument fetchInfo;
  } // latest';

}
