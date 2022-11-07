{

  inputs.packument.url   = "https://registry.npmjs.org/cli-boxes?rev=12-c8b6968f716a93862d838f9ff2047620";
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
    ident = "cli-boxes";
    ldir  = "info/unscoped/c/cli-boxes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
