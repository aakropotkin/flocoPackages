{

  inputs.packument.url   = "https://registry.npmjs.org/growly?rev=14-e56477d69fa3063cb037a937279cbf24";
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
    ident = "growly";
    ldir  = "info/unscoped/g/growly";
    inherit packument fetchInfo;
  } // latest';

}
