{

  inputs.packument.url   = "https://registry.npmjs.org/systeminformation?rev=577-d13b7432c7424dee51b3e304fb0c2747";
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
    ident = "systeminformation";
    ldir  = "info/unscoped/s/systeminformation";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
