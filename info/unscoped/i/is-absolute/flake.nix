{

  inputs.packument.url   = "https://registry.npmjs.org/is-absolute?rev=30-51fa09e24e4bd9bb134fb0f661a38562";
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
    ident = "is-absolute";
    ldir  = "info/unscoped/i/is-absolute";
    inherit packument fetchInfo;
  } // latest';

}
